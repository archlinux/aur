# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.44.0.0
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
md5sums=('9d9a3496c02bc3b0d8dd950210b52b81')
sha256sums=('b40fc9dd1c1f9dbb9a8ed27646ea9cf254063c60d426f6c3153ec95cf249155f')

prepare() {
  # update SLF4J
  cd ${pkgname}-${pkgver}
  mvn versions:use-dep-version -Dincludes=org.slf4j:slf4j-api -DdepVersion=2.0.9 -DforceVersion=true
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
