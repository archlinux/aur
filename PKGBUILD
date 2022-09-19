# Maintainer: Witalij Berdinskich radio_rogal[at]keemail.me
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.39.3.0
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('810263f4c7e019a0b47012a4977dd174673fec56467145f502dee5ea977dc7bc')

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
