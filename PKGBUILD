# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=mod_tile-git
pkgver=0.4.r229.g4f9b9f1
pkgrel=1
pkgdesc='Mod tile is an apache module to serve raster Mapnik tiles'
arch=('i686' 'x86_64')
url='http://wiki.openstreetmap.org/wiki/Mod_tile'
license=('GPL2')
depends=('mapnik' 'apache' 'boost' 'iniparser')
makedepends=()
backup=('etc/renderd.conf' 'etc/httpd/conf/extra/mod_tile.conf')
source=('git+https://github.com/openstreetmap/mod_tile/')
md5sums=('SKIP')

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
