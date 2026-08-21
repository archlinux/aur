# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=castr
pkgver=0.2.0
pkgrel=1
pkgdesc="Cast your Hyprland screen to an Apple TV or a Chromecast: mirror or extend, from a menu or the CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mrCode/castr"
license=('MIT')

# avahi is the only hard runtime dependency: castr asks it what is on the
# network rather than running its own mDNS browser, because avahi has been warm
# since boot and answers instantly while a fresh browser takes seconds.
depends=('avahi')

# doubletake does the actual AirPlay work, and only that: Chromecast casting is
# castr's own code and needs none of it. It is an optdepend rather than a depend
# so `castr list` and the menu still work while you install it -- and because it
# lives in the AUR, which a depend cannot pull in for you.
#
# gstreamer is what captures and encodes for Chromecast. Its plugin packages are
# optdepends for the same reason the encoder is chosen at runtime: a machine with
# Intel graphics needs a different one from a machine with NVIDIA, and requiring
# both would install a video stack nobody asked for on a laptop that only ever
# casts to an Apple TV.
optdepends=(
  'doubletake-git: AirPlay streaming (REQUIRED for AirPlay; 0.4.0 cannot capture on Hyprland)'
  'gst-plugin-pipewire: screen capture for Chromecast (REQUIRED for Chromecast)'
  'gst-plugins-base: scaling and rate control (REQUIRED for Chromecast)'
  'gst-plugins-good: AAC parsing (REQUIRED for Chromecast)'
  'gst-plugins-bad: HLS output and H.264 parsing (REQUIRED for Chromecast)'
  'gst-libav: the silent AAC track a receiver refuses to play without (REQUIRED for Chromecast)'
  'gst-plugin-va: hardware H.264 encoding on Intel and AMD'
  'gst-plugins-ugly: x264, the software encoding fallback'
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

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c293ba5e69866a5c36016a2f3097887b9a92cdb6a84e70049dd094269feba8f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0          # a single static binary is the point of the rewrite
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"

  go build -ldflags "-s -w -X main.version=${pkgver}" -o build/castr ./cmd/castr
  go build -ldflags "-s -w -X main.version=${pkgver}" -o build/castrd ./cmd/castrd
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  # The suite needs no compositor, no network, and no receiver: every external
  # command is injected. The process-group tests do spawn real short-lived
  # shells, which is the point of them.
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 build/castr  "${pkgdir}/usr/bin/castr"
  install -Dm755 build/castrd "${pkgdir}/usr/bin/castrd"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
