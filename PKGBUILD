# Maintainer: Fethbita <aur AT fethbita DOT com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: <philipp.classen@posteo.de>

pkgname=verifpal
pkgver=0.28.1
pkgrel=1
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3' 'custom:cc-by-nc-nd-4.0')
makedepends=('go')
source=("https://github.com/symbolicsoft/verifpal/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname-$pkgver-manual.pdf::https://static.verifpal.com/manual.pdf"
        "$pkgname-$pkgver-manual-license.txt::https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt")
sha256sums=('4eb7204e0558884797e5cdde1b18c7040608b2640a0e6a84b284b57548814765'
            '894b7e6b2368962e6788eeaa6feaa8a8af37f29f598a97a77b31b46edcb7b6c2'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/linux
}

build() {
  cd "$pkgname-$pkgver"
  go build -trimpath -gcflags="-e" -ldflags="-s -w" -o build/linux ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go clean -testcache
  go test ./...
}

package() {
  install -Dm644 "$pkgname-$pkgver-manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
  install -Dm644 "$pkgname-$pkgver-manual-license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/manual-LICENSE"
  cd "$pkgname-$pkgver"
  install -Dm755 "build/linux/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
