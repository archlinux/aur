# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# FIXME: mruby disabled until we figure out how to build with it

pkgname=h2o
pkgver=2.3.0_beta2
pkgrel=1
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
depends=('libuv' 'libyaml' 'wslay' 'zlib')
makedepends=('gcc' 'bison' 'cmake' 'libtool' 'make' 'pkg-config' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/h2o/$pkgname/tar.gz/v${pkgver/_/-}
        h2o.service)
sha512sums=('b30330482f8dee98d990c34c2c91145ca864d52773ae5e42ebc30390fe07d47d043135c773b11deeb4dbcd13882184f86eac17dd2f4b75a92e9d63955d54fec0'
	    'c7e797ccf38aaec017e02c11549ff42dc384555b8a4a19e864d50ba1148110dab426b47326771481dc04cd2a1b65d7916c6cfff771fb0e6555887765703a0b9c')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('libh2o')

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"

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
  cd "$srcdir/$pkgname-${pkgver/_/-}"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg2 'Installing systemd service...'
  install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"

  msg2 'Installing conf file...'
  install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
