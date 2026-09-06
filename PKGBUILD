# Maintainer: Fethbita <aur AT fethbita DOT com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: <philipp.classen@posteo.de>

pkgname=verifpal
pkgver=1.4.3
pkgrel=1
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3' 'custom:cc-by-nc-nd-4.0')
makedepends=('rust' 'cargo')
source=("https://github.com/symbolicsoft/verifpal/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname-$pkgver-manual.pdf::https://static.verifpal.com/manual.pdf"
        "$pkgname-$pkgver-manual-license.txt::https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt")
sha256sums=('7e540d5558558b7688e37ac29f71c052a3cd8060655c2e5598b8bd51542470f0'
            'ee4ce91c1323be1077bb3f0c2680953996df09b37001105647959bca3a1820e1'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')

build() {
  cd "$pkgname-$pkgver"
  export CFLAGS="${CFLAGS:-} -fno-lto"
  export CXXFLAGS="${CXXFLAGS:-} -fno-lto"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  install -Dm644 "$pkgname-$pkgver-manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
  install -Dm644 "$pkgname-$pkgver-manual-license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/manual-LICENSE"
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
