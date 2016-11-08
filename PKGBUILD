# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=mod_tile-git
pkgver=0.4.r276.g7211cb7
pkgrel=1
pkgdesc='Mod tile is an apache module to serve raster Mapnik tiles'
arch=('i686' 'x86_64')
url='http://wiki.openstreetmap.org/wiki/Mod_tile'
license=('GPL2')
depends=('mapnik' 'apache' 'boost' 'iniparser')
makedepends=()
backup=('etc/renderd.conf' 'etc/httpd/conf/extra/mod_tile.conf')
source=('git+https://github.com/openstreetmap/mod_tile/'
        'mapnik-3.0.12-compile-fix.patch::https://github.com/S73417H/mod_tile/commit/55c410c5655af917fd971ea5bb47d0fc06f41d78.patch')
md5sums=('SKIP'
         '185945c4e897365e9c7062c76a3cee72')

prepare() {
  cd "${srcdir}/mod_tile"
  patch -r - -Np1 -i "${srcdir}/mapnik-3.0.12-compile-fix.patch" || true
}

pkgver() {
  cd "${srcdir}/mod_tile"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mod_tile"

  #fix hardcoded usr/local path
  sed -i 's#/usr/local/lib64#/usr/lib#' includes/render_config.h renderd.conf

  ./autogen.sh
  ./configure --prefix=/usr
  make #-j1 #buggy Makefile, using 1 job: probably forgets some deps, compilation fails
}

package() {
  cd "${srcdir}/mod_tile"
  make DESTDIR="${pkgdir}/" install
  make DESTDIR="${pkgdir}/" install-mod_tile
  mv "${pkgdir}/usr/etc" "${pkgdir}"/
  install -D -m644 mod_tile.conf "${pkgdir}"/etc/httpd/conf/extra/mod_tile.conf
}
