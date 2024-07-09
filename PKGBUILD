# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=('mod_tile' 'renderd')
pkgver=0.7.2
pkgrel=2
pkgdesc='A daemon and apache module for rendering and serving Mapnik raster tiles'
arch=('i686' 'x86_64')
url='https://github.com/openstreetmap/mod_tile'
license=('GPL-2.0-or-later')
optdepends=('libmemcached: Memcached tile storage support')
makedepends=('apache' 'apr' 'cmake' 'glib2' 'iniparser' 'mapnik')
checkdepends=('curl' 'jq')
source=("${url}/archive/v${pkgver}/mod_tile-${pkgver}.tar.gz"
        "v0.7.2_fixes.patch::${url}/compare/v${pkgver}...cda77b0a69fe1489f762ed72e89205381f9608af.patch"
        'renderd.service'
        'renderd-postgresql.service'
        'renderd.sysusers'
        'renderd.tmpfiles')
sha256sums=('7988335986d9dadc5275cd955c5af14d3648addb68b16866bb79f27aa76797e3'
            '062e8f1b0024db625212284bc93fceba5a89920ba8e086b84edd024ef9b5c268'
            '7bb1c67f92e9d253cecbb2f17048fba151a67e470c231fc33605937917b0567a'
            'd6c009e95380d8a9be41f0bd077638cb6adbebb74fff238a2bfc9fbbb3ed49fa'
            'cd6871cdb3e640912c95499e97fe1a2496ba95f102ec65f112bcd546ba736514'
            'cc450b47539d8a3e0d3d78634c78b0019a15097d2fb4e86fa3332957abd82d89')

prepare() {
  if [ -d mod_tile ]
  then
    rm -rf mod_tile
  fi
  mv mod_tile-${pkgver} mod_tile
  cd mod_tile || exit
  patch -Np1 < ../v0.7.2_fixes.patch

  export LDFLAGS
  cmake -B ../build -S . \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_CXX_STANDARD:STRING=17 \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_RUNSTATEDIR:PATH=/run \
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
    -DENABLE_TESTS:BOOL=ON \
    -DUSE_CAIRO:BOOL=OFF \
    -DUSE_CURL:BOOL=OFF \
    -DUSE_RADOS:BOOL=OFF
}

build() {
  cmake --build build
}

check() {
  export CTEST_PARALLEL_LEVEL=${CTEST_PARALLEL_LEVEL:-$(nproc)}
  ctest \
    --output-on-failure \
    --test-dir build
}

package_mod_tile() {
  depends=('apache' 'apr' 'glib2')
  install="${pkgname}.install"
  pkgdesc='An Apache 2 module to deliver map tiles'
  provides=('mod_tile')

  DESTDIR="$pkgdir" cmake --install build --strip

  # License
  install -Dm644 "$srcdir"/mod_tile/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # Example Map
  install -Dm644 "$srcdir"/mod_tile/etc/apache2/renderd-example-map.conf "$pkgdir"/etc/httpd/conf/extra/httpd-tile-renderd-example-map.conf
  install -dm755 "$pkgdir"/usr/share/renderd
  cp -av "$srcdir"/mod_tile/utils/example-map "$pkgdir"/usr/share/renderd/example-map

  # "/etc/renderd.conf", "/usr/bin", "/usr/share/man", "/var/cache/renderd/tiles" & "/run/renderd" are contained in "renderd" package
  cd "$pkgdir" || return
  rm -rf etc/renderd.conf run usr/bin usr/share/man var
}

package_renderd() {
  backup=('etc/renderd.conf')
  depends=('glib2' 'iniparser' 'mapnik')
  pkgdesc='A daemon that renders map tiles using mapnik'
  provides=('renderd')

  DESTDIR="$pkgdir" cmake --install build --strip

  # Systemd service units, sysusers.d & tmpfiles.d configuration files
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "$srcdir"/renderd-postgresql.service "$srcdir"/renderd.service
  install -Dm644 "$srcdir"/renderd.sysusers "$pkgdir"/usr/lib/sysusers.d/renderd.conf
  install -Dm644 "$srcdir"/renderd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/renderd.conf

  # License
  install -Dm644 "$srcdir"/mod_tile/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # "/var/cache/renderd/tiles" & "/run/renderd" will be handled by "renderd.tmpfiles"
  # "/etc/httpd" & "/usr/lib/httpd" are contained in "mod_tile" package
  cd "$pkgdir" || return
  rm -rf etc/httpd run usr/lib/httpd var
}
