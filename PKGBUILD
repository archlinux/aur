# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.25.2
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=(x86_64)
url=https://github.com/xerial/sqlite-jdbc
license=(Apache)
makedepends=(maven)
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('b6bd6c2ac17d37bc425ffd4d92d1b8df67e47819b95ece1065a63a6998b6a453')

prepare() {
  # remove unused sqlite binaries
  cd "${srcdir}/${pkgname}-${pkgver}/src/main/resources/org/sqlite/native"
  find . -mindepth 1 -maxdepth 1 ! -name Linux -exec rm -r {} +
  find Linux -mindepth 1 -maxdepth 1 ! -name "$CARCH" -exec rm -r {} +
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
