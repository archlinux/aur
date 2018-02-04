# Contributor: Calimero <calimeroteknik@free.fr>
# Contributor: jerry73204 <jerry73204@gmail.com>

pkgname=mod_tile-git
pkgver=0.4.r278.ge25bfdb
pkgrel=1
pkgdesc='Mod tile is an apache module to serve raster Mapnik tiles'
arch=('i686' 'x86_64')
url='http://wiki.openstreetmap.org/wiki/Mod_tile'
license=('GPL2')
depends=('mapnik' 'apache' 'boost' 'iniparser')
makedepends=()
backup=('etc/renderd.conf' 'etc/httpd/conf/extra/mod_tile.conf')
source=('git+https://github.com/openstreetmap/mod_tile/'
        'mapnik-3.0.12-compile-fix.patch::https://github.com/S73417H/mod_tile/commit/55c410c5655af917fd971ea5bb47d0fc06f41d78.patch'
        renderd-{standalone,postgresql}.service)
md5sums=('SKIP'
         '185945c4e897365e9c7062c76a3cee72'
         '9865c10e859ae63247036dedf76e6c19'
         'fc895e65f77a95393f9d6e75aaf20f5c')

prepare() {
  cd "${srcdir}/mod_tile"
  patch -r - -Np1 -i "${srcdir}/mapnik-3.0.12-compile-fix.patch" || true
}

pkgver() {
  cd "${srcdir}/mod_tile"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/mod_tile"

  #fix hardcoded usr/local path
  sed -i 's#/usr/local/lib64#/usr/lib#' includes/render_config.h renderd.conf

  #suggest a more archlinux-friendly path by default for fonts
  sed -i 's#font_dir=/usr/share/fonts/truetype#font_dir=/usr/share/fonts/TTF#' renderd.conf
}

build() {
  cd "${srcdir}/mod_tile"

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

  install -D -m644 "${startdir}"/renderd-standalone.service "${pkgdir}"/usr/lib/systemd/system/renderd-standalone.service
  install -D -m644 "${startdir}"/renderd-postgresql.service "${pkgdir}"/usr/lib/systemd/system/renderd-postgresql.service
}
