# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname=binnavi-git
pkgver=0.0.590.8512d7c
pkgrel=2
pkgdesc="BinNavi is a binary analysis IDE that allows to inspect, navigate, edit and annotate control flow graphs and call graphs of disassembled code"
url="https://github.com/google/binnavi"
arch=('any')
license=('Apache')
depends=('java-environment>=7' 'postgresql')
makedepends=('git' 'maven' 'apache-ant')
provides=('binnavi')
conflicts=('binnavi')
source=(git+https://github.com/google/binnavi.git 'binnavi')
sha512sums=('SKIP'
            'bb274ca29a994ef8b98aa77e0be745e297bd2f7e65dd394594169ffec3910b4dd4982e353202c6b201472632a3f7b16bd7d905b7006e21d76b7299b78fc7f390')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  mvn dependency:copy-dependencies
  ant -f src/main/java/com/google/security/zynamics/build.xml \
  build-binnavi-fat-jar
}

package() {
  mkdir -p "${pkgdir}/usr/share/java/binnavi"
  cd "${srcdir}/$pkgname-$pkgver/target/"
  mv * "${pkgdir}/usr/share/java/binnavi/"
  install -D -m755 ${srcdir}/binnavi ${pkgdir}/usr/bin/binnavi
}
# vim:set et sw=2 ts=2 tw=80:
