# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=heidisql
pkgname=${_basename}-gtk2-bin
pkgver=12.17
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (GTK2)"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0-or-later')
conflicts=("${_basename}" heidisql-client)
provides=("${_basename}")
replaces=("heidisql-bin")
depends=('gtk2' 'libperconaserverclient' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'freetds')
source=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb"
	"build-gtk2-${pkgver}.tgz::${url}/releases/download/${pkgver}/build-gtk2-${pkgver}.tgz")
noextract=("build-gtk2-${pkgver}.tgz")
sha256sums=('442b89cf2c3ee7739c5187efa1d5c76993f2d30e8fc67ddad966a7d3a7de4d0c'
            '6a5296bee6389e030c9a917bec85eebfe476c6ffe0c230c3a135e3ecff8efc54')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"
  # upstream deb changed to qt6 so we need to replace the build with the gtk2 one
  rm -rf usr/bin
  install -dm755 usr/bin
  tar xzf "${srcdir}/build-gtk2-${pkgver}.tgz" -C usr/bin heidisql
  chmod 755 usr/bin/heidisql

  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
} 
