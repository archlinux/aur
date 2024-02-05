# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.45.1.0
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
md5sums=('96f9769292ccb9e4584ffad6f6f92aff')
sha256sums=('aed7e39413c684b504b750ae10e4bfd1946daeba6876388e163588f68501d051')

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
