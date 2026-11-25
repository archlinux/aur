# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgbase=mod_tile
pkgname=('mod_tile' 'renderd')
pkgver=0.9.1
pkgrel=3
pkgdesc='A daemon and apache module for rendering and serving Mapnik raster tiles'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/openstreetmap/mod_tile'
license=('GPL-2.0-or-later')
makedepends=(
  'apache'
  'apr'
  'boost'
  'cmake'
  'glib2'
  'iniparser'
  'mapnik'
)
checkdepends=(
  'curl'
  'jq'
  'procps-ng'
)
source=(
  "${url}/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
  'renderd-postgresql.service'
  'renderd.service'
  'renderd.sysusers'
  'renderd.tmpfiles'
)
sha256sums=(
  'a8fa86fec638d1f3a6268d1eddf6154712b539602b3f524aafcceede37809e61'
  '6f4bae7a7c7e52344633941db5a5720c448bef0282aa306347f336a475d0d44f'
  '7a90d0f27e8a0fea4c8bcad141eb99ec57e65b42638e60a04d3b760b0460ed6f'
  '9d36c0aec084797d4bd8f641bc204a4f04491a5e65724c65f0c1e701b1453966'
  '8baa8e59d106b54dd1fb8f4cef06b7d9b5adf9f4dcc79fce14c68d3a498a5550'
)

build() {
  cmake -B build -S "${pkgbase}-${pkgver}" \
    -D CMAKE_BUILD_TYPE:STRING=None \
    -D CMAKE_INSTALL_LOCALSTATEDIR:PATH=/var \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D CMAKE_INSTALL_RUNSTATEDIR:PATH=/run \
    -D CMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
    -D ENABLE_TESTS:BOOL=ON \
    -D USE_CAIRO:BOOL=OFF \
    -D USE_CURL:BOOL=OFF \
    -D USE_MEMCACHED:BOOL=OFF \
    -D USE_RADOS:BOOL=OFF

  cmake --build build
}

check() {
  ctest \
    --output-on-failure \
    --parallel \
    --test-dir build
}

package_mod_tile() {
  pkgdesc='An Apache 2 module to deliver map tiles'
  depends=(
    'apache'
    'apr'
    'glib2'
    'iniparser'
  )
  backup=(
    'etc/httpd/conf/extra/httpd-tile-renderd-example-map.conf'
  )
  install="${pkgname}.install"

  DESTDIR="${pkgdir}" cmake --install build

  # Example Map
  install -D --mode=644 \
    "${srcdir}/${pkgbase}-${pkgver}/etc/apache2/renderd-example-map.conf" \
    "${pkgdir}/etc/httpd/conf/extra/httpd-tile-renderd-example-map.conf"
  install --directory --mode=755 "${pkgdir}/usr/share/renderd/example-map"
  cp --no-preserve=ownership --recursive \
    "${srcdir}/${pkgbase}-${pkgver}/utils/example-map/." \
    "${pkgdir}/usr/share/renderd/example-map/"

  # Remove files belonging to renderd or managed by tmpfiles.d
  rm --recursive \
    "${pkgdir}/etc/renderd.conf" \
    "${pkgdir}/run" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/man/man1" \
    "${pkgdir}/usr/share/man/man5/renderd.conf.5" \
    "${pkgdir}/var"
}

package_renderd() {
  pkgdesc='A daemon that renders map tiles using mapnik'
  depends=(
    'glib2'
    'iniparser'
    'mapnik'
  )
  backup=(
    'etc/renderd.conf'
  )

  DESTDIR="${pkgdir}" cmake --install build

  # Systemd units, sysusers.d, and tmpfiles.d
  install -D --mode=644 --target-directory="${pkgdir}/usr/lib/systemd/system/" \
    "${srcdir}/renderd-postgresql.service" \
    "${srcdir}/renderd.service"
  install -D --mode=644 \
    "${srcdir}/renderd.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/renderd.conf"
  install -D --mode=644 \
    "${srcdir}/renderd.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/renderd.conf"

  # Remove files belonging to mod_tile or managed by tmpfiles.d
  rm --recursive \
    "${pkgdir}/etc/httpd" \
    "${pkgdir}/run" \
    "${pkgdir}/usr/lib/httpd" \
    "${pkgdir}/usr/share/man/man5/mod_tile.5" \
    "${pkgdir}/var"
}
