# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.49.0.0
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
md5sums=('b3860498e129fdeb1c33e5a408b7a400')
sha256sums=('c77f993b82b94ea0df41722d583956a4628bb780d78f90457b6206cbd702286e')

prepare() {
  # update SLF4J
  cd ${pkgname}-${pkgver}
  mvn versions:use-dep-version -Dincludes=org.slf4j:slf4j-api -DdepVersion=2.0.11 -DforceVersion=true
  # remove unused sqlite binaries
  cd src/main/resources/org/sqlite/native
  find . ! -path "./Linux/$CARCH/*" -type f -delete
  find . -type d -empty -delete
}

build() {
  cd ${pkgname}-${pkgver}
  mvn package -DskipTests
}

check() {
  cd ${pkgname}-${pkgver}
  mvn verify
}

package() {
  cd ${pkgname}-${pkgver}/target

  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

# vim:set ts=2 sw=2 et:
