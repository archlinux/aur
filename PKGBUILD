# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=masscan
pkgver=1.0.3
pkgrel=1
pkgdesc="TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes"
url="https://github.com/robertdavidgraham/masscan"
arch=('i686' 'x86_64')
license=('AGPL')
depends=('libpcap')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/robertdavidgraham/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('e64b11deaaaa71d5be95e8f2b1fdfa679f5c8e8074c97f9d60d57659f33aec0699673c5aab72824f62d1a8b0e8c9188dcf296dd078bc6c2dbdad95c35c3a5f40')

prepare() {
  cd ${pkgname}-${pkgver}
  # Fix build with GCC 5.x
  sed -i "s|#elif defined(__GNUC__) && (__GNUC__ == 4)|#elif defined(__GNUC__)|" src/string_s.h
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make regress
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 doc/masscan.8 "${pkgdir}/usr/share/man/man8/masscan.8"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 doc/masscan.8.markdown "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION.md"
}

# vim: ts=2 sw=2 et:
