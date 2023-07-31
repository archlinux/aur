# Contributor: Calimero <calimeroteknik@free.fr>
# Contributor: jerry73204 <jerry73204@gmail.com>

pkgname=mod_tile-git
pkgver=0.6.1.r45.g24a5752
pkgrel=1
pkgdesc='Mod tile is an apache module to serve raster Mapnik tiles'
arch=('i686' 'x86_64')
url='http://wiki.openstreetmap.org/wiki/Mod_tile'
license=('GPL2')
depends=('apache' 'cairo' 'curl' 'glib2' 'iniparser' 'mapnik')
optdepends=('ceph-libs' 'libmemcached')
makedepends=('cmake')
backup=('etc/renderd.conf')
source=('git+https://github.com/openstreetmap/mod_tile.git' 'renderd.service' 'renderd-postgresql.service' 'renderd.sysusers' 'renderd.tmpfiles')
sha256sums=('SKIP'
            'e346bae01738e276eae63a6b672c971b8f21047ea62b025ac9a283f20d5d9d61'
            'bd81b42f4db7dd2f417e33404792f071e7116fc9cd22b200451cd3243f89776c'
            'cd6871cdb3e640912c95499e97fe1a2496ba95f102ec65f112bcd546ba736514'
            'cc450b47539d8a3e0d3d78634c78b0019a15097d2fb4e86fa3332957abd82d89')

pkgver() {
  cd mod_tile || exit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B mod_tile_build -S mod_tile -DCMAKE_BUILD_TYPE:STRING=Release -DENABLE_TESTS:BOOL=ON
  cmake --build mod_tile_build
}

check() {
  ctest --test-dir mod_tile_build
}

package() {
  DESTDIR="${pkgdir}" cmake --install mod_tile_build --prefix /usr --strip

  # The creation of "/var/cache/renderd/tiles" & "/var/run/renderd" will be handled by "renderd.tmpfiles"
  rm -rf "$pkgdir"/var

  install -Dm644 "$srcdir"/mod_tile/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "$srcdir"/renderd-postgresql.service "$srcdir"/renderd.service
  install -Dm644 "$srcdir"/renderd.sysusers "$pkgdir"/usr/lib/sysusers.d/renderd.conf
  install -Dm644 "$srcdir"/renderd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/renderd.conf
}
