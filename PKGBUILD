# Contributor: Calimero <calimeroteknik@free.fr>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=('mod_tile-git' 'renderd-git')
pkgver=0.9.1.r2.gd77dca7
pkgrel=1
pkgdesc='A daemon and apache module for rendering and serving Mapnik raster tiles'
arch=('i686' 'x86_64')
url='https://github.com/openstreetmap/mod_tile'
license=('GPL-2.0-or-later')
optdepends=('libmemcached: Memcached tile storage support')
makedepends=('apache'
             'apr'
             'cmake'
             'git'
             'glib2'
             'iniparser'
             'mapnik')
checkdepends=('curl' 'jq')
source=('git+https://github.com/openstreetmap/mod_tile.git'
        'renderd.service'
        'renderd-postgresql.service'
        'renderd.sysusers'
        'renderd.tmpfiles')
sha256sums=('SKIP'
            '9b7a3c191ddbdafc06bf92943c0fe4a0686cf9a17b3f3492fd945696bff14597'
            'd3f8d9deb5facb846313eee254398f06edeb29c732b957d4b895a16c2e3d8879'
            '7dd8ee22408ace2410b7e04e44867e7d6126f52d3c82ab057ff929f9b486c229'
            '8baa8e59d106b54dd1fb8f4cef06b7d9b5adf9f4dcc79fce14c68d3a498a5550')

pkgver() {
  git -C mod_tile describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  export CXXFLAGS CFLAGS LDFLAGS
  cmake -B build -S mod_tile \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_INSTALL_LOCALSTATEDIR:PATH=/var \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D CMAKE_INSTALL_RUNSTATEDIR:PATH=/run \
    -D CMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
    -D ENABLE_TESTS:BOOL=ON \
    -D USE_CAIRO:BOOL=OFF \
    -D USE_CURL:BOOL=OFF \
    -D USE_RADOS:BOOL=OFF
}

build() {
  # Override VERSION with ${pkgver}
  sed -i 's/VERSION ".*"/VERSION "'${pkgver}'"/g' mod_tile/includes/config.h.in
  export MAKEFLAGS
  cmake --build build
}

check() {
  ctest \
    --output-on-failure \
    --parallel \
    --test-dir build
}

package_mod_tile-git() {
  conflicts=('mod_tile')
  depends=('apache' 'apr' 'glib2' 'iniparser')
  install="${pkgname}.install"
  pkgdesc='An Apache 2 module to deliver map tiles'
  provides=('mod_tile')

  DESTDIR="${pkgdir}" cmake --install build --strip

  # License
  install -Dm644 "${srcdir}"/mod_tile/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Example Map
  install -Dm644 "${srcdir}"/mod_tile/etc/apache2/renderd-example-map.conf "${pkgdir}"/etc/httpd/conf/extra/httpd-tile-renderd-example-map.conf
  install -dm755 "${pkgdir}"/usr/share/renderd
  cp -av "${srcdir}"/mod_tile/utils/example-map "${pkgdir}"/usr/share/renderd/example-map

  # "/etc/renderd.conf", "/usr/bin", "/usr/share/man/man1", "/usr/share/man/man5/renderd.conf.5", "/var/cache/renderd/tiles" & "/run/renderd" are contained in "renderd" package
  pushd "${pkgdir}" || return
  rm -rf etc/renderd.conf run usr/bin usr/share/man/man1 usr/share/man/man5/renderd.conf.5 var
}

package_renderd-git() {
  conflicts=('renderd')
  backup=('etc/renderd.conf')
  depends=('glib2' 'iniparser' 'mapnik')
  pkgdesc='A daemon that renders map tiles using mapnik'
  provides=('renderd')

  DESTDIR="${pkgdir}" cmake --install build --strip

  # Systemd service units, sysusers.d & tmpfiles.d configuration files
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/renderd-postgresql.service "${srcdir}"/renderd.service
  install -Dm644 "${srcdir}"/renderd.sysusers "${pkgdir}"/usr/lib/sysusers.d/renderd.conf
  install -Dm644 "${srcdir}"/renderd.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/renderd.conf

  # License
  install -Dm644 "${srcdir}"/mod_tile/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # "/var/cache/renderd/tiles" & "/run/renderd" will be handled by "renderd.tmpfiles"
  # "/etc/httpd", "/usr/lib/httpd" & "/usr/share/man/man5/mod_tile.5" are contained in "mod_tile" package
  pushd "${pkgdir}" || return
  rm -rf etc/httpd run usr/lib/httpd usr/share/man/man5/mod_tile.5 var
}
