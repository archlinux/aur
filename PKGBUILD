# Maintainer: Phundahl
pkgname=tailtui
pkgver=1.2.0
pkgrel=1
pkgdesc="A brutalist, keyboard-centric terminal user interface for Tailscale"
arch=('x86_64' 'aarch64')
url="https://github.com/Phundahl/tailtui"
license=('MIT')
depends=('tailscale')
makedepends=('go')
# The build strips symbols (-s -w), so there is no debuginfo to split out;
# without this makepkg emits an empty tailtui-debug package and a warning.
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phundahl/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9b50d2de98edf6c6c23cf812ebd7ef40d2e2d10d718d8f55ed9b737eb449af48')

build() {
  cd "${pkgname}-${pkgver}"

  # Arch defaults for reproducible, hardened Go builds.
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # -X stamps the version into main.version, which the TUI reads via
  # tui.SetVersion() so the footer shows the packaged release rather than
  # the in-tree development literal.
  go build -ldflags "-X main.version=${pkgver} -s -w" -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"

  # The binary itself.
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # License, in the standard Arch location.
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation.
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
