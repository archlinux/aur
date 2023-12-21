# Contributor: Calimero <calimeroteknik@free.fr>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=('mod_tile' 'renderd')
pkgver=0.7.0
pkgrel=1
pkgdesc='Mod tile is a daemon and apache module for rendering and serving Mapnik raster tiles'
arch=('i686' 'x86_64')
url='https://github.com/openstreetmap/mod_tile'
license=('GPL2')
optdepends=('ceph-libs: RADOS tile storage support'
            'libmemcached: Memcached tile storage support')
makedepends=('apache' 'apr' 'boost' 'cairo' 'cmake' 'glib2' 'iniparser' 'mapnik')
checkdepends=('jq')
source=("${url}/archive/v${pkgver}/mod_tile-${pkgver}.tar.gz"
        'renderd.service'
        'renderd-postgresql.service'
        'renderd.sysusers'
        'renderd.tmpfiles')
sha256sums=('32860e5c1b67c6666a11f0c2524da77d95393d607c8fbfd18849bbd8322c5b0f'
            '7bb1c67f92e9d253cecbb2f17048fba151a67e470c231fc33605937917b0567a'
            'd6c009e95380d8a9be41f0bd077638cb6adbebb74fff238a2bfc9fbbb3ed49fa'
            'cd6871cdb3e640912c95499e97fe1a2496ba95f102ec65f112bcd546ba736514'
            'cc450b47539d8a3e0d3d78634c78b0019a15097d2fb4e86fa3332957abd82d89')

build() {
  cmake -B mod_tile_build -S mod_tile-${pkgver} -DCMAKE_BUILD_TYPE:STRING=Release -DENABLE_TESTS:BOOL=ON
  cmake --build mod_tile_build
}

check() {
  ctest --output-on-failure --test-dir mod_tile_build
}

package_mod_tile() {
  depends=('apache' 'apr' 'cairo' 'curl' 'glib2')
  install="${pkgname}.install"
  pkgdesc='An Apache 2 module to deliver map tiles'
  provides=('mod_tile')

  DESTDIR="$pkgdir" cmake --install mod_tile_build --prefix /usr --strip

  # License
  install -Dm644 "$srcdir"/mod_tile-${pkgver}/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # Example Map
  install -Dm644 "$srcdir"/mod_tile-${pkgver}/etc/apache2/renderd-example-map.conf "$pkgdir"/etc/httpd/conf/extra/httpd-tile-renderd-example-map.conf
  install -dm755 "$pkgdir"/usr/share/renderd
  cp -av "$srcdir"/mod_tile-${pkgver}/utils/example-map "$pkgdir"/usr/share/renderd/example-map

  # "/etc/renderd.conf", "/usr/bin", "/usr/share/man" & "/var" are contained in/handled by "renderd" package
  rm -rf "$pkgdir"/etc/renderd.conf "$pkgdir"/usr/bin "$pkgdir"/usr/share/man "$pkgdir"/var
}

package_renderd() {
  backup=('etc/renderd.conf')
  depends=('cairo' 'curl' 'glib2' 'iniparser' 'mapnik')
  pkgdesc='A daemon that renders map tiles using mapnik'
  provides=('renderd')

  DESTDIR="$pkgdir" cmake --install mod_tile_build --prefix /usr --strip

  # Systemd service units, sysusers.d & tmpfiles.d configuration files
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "$srcdir"/renderd-postgresql.service "$srcdir"/renderd.service
  install -Dm644 "$srcdir"/renderd.sysusers "$pkgdir"/usr/lib/sysusers.d/renderd.conf
  install -Dm644 "$srcdir"/renderd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/renderd.conf

  # License
  install -Dm644 "$srcdir"/mod_tile-${pkgver}/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # The creation of "/var/cache/renderd/tiles" & "/var/run/renderd" will be handled by "renderd.tmpfiles"
  rm -rf "$pkgdir"/var

  # "/etc/httpd" & "/usr/lib/httpd" are contained in "mod_tile" package
  rm -rf "$pkgdir"/etc/httpd "$pkgdir"/usr/lib/httpd
}
