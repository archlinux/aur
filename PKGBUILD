# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=doubletake-alchemy
pkgver=0.4.0.alchemy.2
pkgrel=1
pkgdesc='AirPlay sender for Linux with Hyprland extended desktops (alchemy fork)'
arch=('x86_64' 'aarch64')
url='https://github.com/alchemy/doubletake'
license=('LGPL-3.0-or-later')
depends=(
  'bash' 'glibc' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
  'gst-plugins-bad' 'gst-plugins-ugly' 'gst-plugin-pipewire'
  'libpulse' 'xdg-desktop-portal' 'systemd' 'coreutils'
)
makedepends=('go>=1.25')
optdepends=(
  'hyprland: virtual monitors for extend mode'
  'xdg-desktop-portal-hyprland: Hyprland capture and automatic extend selection'
  'xdg-desktop-portal-wlr: capture on other wlroots compositors'
  'gst-plugin-va: VA-API hardware video encoding'
  'xorg-xrandr: primary monitor detection for X11 capture'
  'org.freedesktop.secrets: system keyring credential storage'
)
provides=("doubletake=${pkgver}")
conflicts=('doubletake')
# Go's DWARF output is not supported by Arch's debugedit on this toolchain.
options=('!lto' '!debug')
# Release tag maps directly to the Arch-compatible package version.
_tag=v${pkgver/.alchemy./-alchemy.}
_source_dir=doubletake-${_tag#v}
source=("doubletake-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('51f418f6cc55ee19d4c590dfe2820bf134d549986ff96b7478719820634fb3b7')

prepare() {
  cd "${_source_dir}"
  export GOPATH="${srcdir}/go"
  export GOTOOLCHAIN=local
  export GOFLAGS=-modcacherw
  go mod download
}

build() {
  cd "${_source_dir}"
  export GOPATH="${srcdir}/go"
  export GOTOOLCHAIN=local
  export GOFLAGS=-modcacherw
  export CGO_ENABLED=0
  for command in doubletake doubletake-ctl doubletake-test-receiver; do
    go build -mod=readonly -trimpath -buildmode=pie -o "bin/${command}" "./cmd/${command}"
  done
}

check() {
  cd "${_source_dir}"
  export GOPATH="${srcdir}/go"
  export GOTOOLCHAIN=local
  export GOFLAGS=-modcacherw
  export CGO_ENABLED=0
  go test -mod=readonly ./... -timeout=120s
}

package() {
  cd "${_source_dir}"
  for command in doubletake doubletake-ctl doubletake-test-receiver; do
    install -Dm755 "bin/${command}" "${pkgdir}/usr/bin/${command}"
    install -Dm644 "man/man1/${command}.1" "${pkgdir}/usr/share/man/man1/${command}.1"
  done
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 FORK.md "${pkgdir}/usr/share/doc/${pkgname}/FORK.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL"
}
