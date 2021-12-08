# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# FIXME: mruby disabled until we figure out how to build with it

pkgname=h2o-2.2
_pkgname=h2o
pkgver=2.2.6
pkgrel=1
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
depends=('libuv' 'libyaml' 'wslay' 'zlib')
makedepends=('gcc' 'bison' 'cmake' 'libtool' 'make' 'pkg-config' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')
source=($_pkgname-$pkgver.tar.gz::https://codeload.github.com/h2o/$_pkgname/tar.gz/v${pkgver/_/-}
        h2o.service)
sha512sums=('f2f28905c01782a0432c9dfdb2f21054e0a4741ac4c5f26802d4b439d0172840aa215aba5dc7c9af62275dcc24de105674a3819384dc38246e43ce3e8263eb20'
	    'c7e797ccf38aaec017e02c11549ff42dc384555b8a4a19e864d50ba1148110dab426b47326771481dc04cd2a1b65d7916c6cfff771fb0e6555887765703a0b9c')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('libh2o' 'h2o' 'h2o-git')

build() {
  cd "$srcdir/$_pkgname-${pkgver/_/-}"

  msg2 'Building...'
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_BUNDLED_SSL=on \
    -DWITH_MRUBY=off \
    .
  make
  make libh2o
}

package() {
  cd "$srcdir/$_pkgname-${pkgver/_/-}"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

  msg2 'Installing systemd service...'
  install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"

  msg2 'Installing conf file...'
  install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
