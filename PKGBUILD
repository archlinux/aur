# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname=binnavi-git
pkgver=v6.0.0.10.a2a3fa4
pkgrel=2
pkgdesc="A binary analysis IDE that allows to inspect, navigate, edit and annotate control flow graphs and call graphs of disassembled code"
url="https://github.com/google/binnavi"
arch=('any')
license=('Apache')
depends=('java-runtime>=7' 'postgresql')
makedepends=('git' 'maven' 'apache-ant' 'java-environment>=7')
provides=('binnavi')
conflicts=('binnavi')
source=(git+https://github.com/google/binnavi.git 'binnavi.sh')
sha512sums=('SKIP'
            'bb274ca29a994ef8b98aa77e0be745e297bd2f7e65dd394594169ffec3910b4dd4982e353202c6b201472632a3f7b16bd7d905b7006e21d76b7299b78fc7f390')

pkgver() {
  cd "${srcdir}/binnavi"
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/binnavi"
  mvn dependency:copy-dependencies -Dmaven.repo.local="${srcdir}/$pkgname-$pkgver"
  ant -f src/main/java/com/google/security/zynamics/build.xml \
    build-binnavi-fat-jar
}

package() {
  mkdir -p "${pkgdir}/usr/share/java/binnavi"
  cd "${srcdir}/$pkgname/target/"
  mv binnavi-all.jar "${pkgdir}/usr/share/java/binnavi/"
  install -D -m755 "${srcdir}/binnavi.sh" "${pkgdir}/usr/bin/binnavi"
}
# vim:set et sw=2 ts=2 tw=80:
