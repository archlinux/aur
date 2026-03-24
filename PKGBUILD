# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: SaultDon <sault.don gmail>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-sfcgal
_pkgname=${pkgname%-sfcgal}
pkgver=3.6.2
pkgrel=1
pkgdesc='A spatial database extender for PostgreSQL, with SFCGAL support'
arch=('i686' 'x86_64')
url='https://postgis.net/'
license=(
  'GPL-3.0-or-later'    # PostGIS is GPL-2.0-or-later, but pkg has to be GPL3+ if linked with GPL3+ code like cgal (via sfcgal)
  'LicenseRef-PostGIS'
)
depends=(
  'gcc-libs'
  'gdal'
  'geos'
  'glibc'
  'json-c'
  'libxml2'
  'pcre2'
  'postgresql-libs'
  'proj'
  'protobuf-c'
  'sfcgal'
  'sh'
)
makedepends=(
  'clang'
  'llvm'
  'postgresql'
)
optdepends=('perl: for contrib script postgis_restore.pl')
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
source=("https://download.osgeo.org/postgis/source/${_pkgname}-${pkgver}.tar.gz")
b2sums=('66a998b1495bd4c03943fa718f08dee5abcd7ee9f16c3eec87574672f785359456f3d1913b1d26882968ce812bda8db86b5fc42c241ed82b1eb75a227034280c')

prepare() {
  cd "${_pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --libexecdir="/usr/lib/${_pkgname}" \
    --sysconfdir=/etc \
    --sharedstatedir="/var/lib/${_pkgname}" \
    --localstatedir=/var \
    --enable-static=no \
    --enable-lto \
    --with-sfcgal

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
