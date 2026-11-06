# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=castr
pkgver=0.3.0
pkgrel=1
pkgdesc="Cast your Hyprland screen to an Apple TV or a Chromecast: mirror or extend, from a menu or the CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mrCode/castr"
# castr is MIT. castr-airplay, the AirPlay helper built below, is doubletake
# and keeps doubletake's LGPL-3.0; it is a separate program castr runs.
license=('MIT' 'LGPL-3.0-only')

# castr's branch of doubletake (github.com/mrCode/doubletake, branch castr),
# built here as castr-airplay. castr ships its own rather than depending on
# whichever doubletake is installed, because its security depends on it:
# upstream doubletake does not authenticate a receiver it has paired with, so a
# device on the LAN answering at a paired Apple TV's address receives the
# screen. The fix is offered upstream as omarroth/doubletake#67.
_airplay=castr-airplay-1

# avahi: castr asks it what is on the network rather than running its own mDNS
# browser, because avahi has been warm since boot and answers instantly while a
# fresh browser takes seconds.
#
# GStreamer captures and encodes for BOTH backends: castr's Chromecast code and
# castr-airplay both build pipelines from these. They were optdepends while
# AirPlay came from a separate doubletake package that pulled them in itself;
# with castr-airplay built in, every cast needs them.
depends=(
  'avahi'
  'gstreamer'
  'gst-plugin-pipewire'   # screen capture
  'gst-plugins-base'      # scaling and rate control
  'gst-plugins-good'      # AAC parsing
  'gst-plugins-bad'       # H.264 parsing, HLS output
  'gst-libav'             # the AAC track a Chromecast refuses to play without
)

# The encoder is chosen at runtime: a machine with Intel graphics needs a
# different one from a machine with NVIDIA, and requiring both would install
# drivers' worth of plugins nobody asked for.
optdepends=(
  'gst-plugin-va: hardware H.264 encoding on Intel and AMD'
  'gst-plugins-ugly: x264, the software encoding fallback'
  'libpulse: pactl, which castr-airplay uses to send audio to an Apple TV'
  'hyprland: required in practice — castr drives its outputs and screen-share portal'
  'libnotify: desktop notifications'
  'quickshell: bar widget on Omarchy Quarto and later (see castr-indicator)'
  'waybar: bar indicator on earlier setups'
)
makedepends=('go' 'git')

# The binaries are built with -s -w, so there are no debug symbols to split
# out. Without this makepkg still emits an empty castr-debug package and warns
# about it on every build.
options=('!debug')
install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_airplay}.tar.gz::https://github.com/mrCode/doubletake/archive/refs/tags/${_airplay}.tar.gz")
sha256sums=('00fb40ff544f5ee1a5647e723223b1a4d654bd2d46747d0aee592f0425b454d8'
            '7452cd9a3c8c6feac063b6d60977ea5d8448a75aeb62b54a6d40eaed9753d8db')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0          # a single static binary is the point of the rewrite
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"

  go build -ldflags "-s -w -X main.version=${pkgver}" -o build/castr ./cmd/castr
  go build -ldflags "-s -w -X main.version=${pkgver}" -o build/castrd ./cmd/castrd

  cd "${srcdir}/doubletake-${_airplay}"
  go build -ldflags "-s -w" -o build/castr-airplay ./cmd/doubletake
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  # The suite needs no compositor, no network, and no receiver: every external
  # command is injected. The process-group tests do spawn real short-lived
  # shells, which is the point of them.
  go test ./...

  # castr-airplay's own suite includes the receiver-authentication tests: an
  # impostor at a paired receiver's address must get nothing.
  cd "${srcdir}/doubletake-${_airplay}"
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 build/castr  "${pkgdir}/usr/bin/castr"
  install -Dm755 build/castrd "${pkgdir}/usr/bin/castrd"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/doubletake-${_airplay}/build/castr-airplay" \
    "${pkgdir}/usr/lib/castr/castr-airplay"
  install -Dm644 "${srcdir}/doubletake-${_airplay}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.castr-airplay"

  # Bar integrations, both shipped: Omarchy Quarto replaced waybar with
  # Quickshell, and older setups still run waybar.
  install -Dm644 share/quickshell/castr-indicator/manifest.json \
    "${pkgdir}/usr/share/${pkgname}/quickshell/castr-indicator/manifest.json"
  install -Dm644 share/quickshell/castr-indicator/Widget.qml \
    "${pkgdir}/usr/share/${pkgname}/quickshell/castr-indicator/Widget.qml"
  install -Dm644 share/waybar/cast-indicator.jsonc \
    "${pkgdir}/usr/share/${pkgname}/waybar/cast-indicator.jsonc"
  install -Dm644 share/waybar/cast-indicator.css \
    "${pkgdir}/usr/share/${pkgname}/waybar/cast-indicator.css"
}
