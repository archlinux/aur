# Maintainer: Witalij Berdinskich radio_rogal[at]keemail.me
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.36.0.3
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('c98fbfd92540c14d6f4b40b45d4d084a04f94796b46ec7d345d92712131bc7e0')

prepare() {
  cd "${srcdir}"
  ln -s "${pkgname}-${pkgver}" "${pkgname}"
  # remove unused sqlite binaries
  cd "${srcdir}/${pkgname}-${pkgver}/src/main/resources/org/sqlite/native"
  find . ! -path "./Linux/$CARCH/*" -type f -delete
  find . -type d -empty -delete
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn package -DskipTests
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn verify
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/target"

  install -Dm644 "${pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s "${pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

# vim:set ts=2 sw=2 et:
