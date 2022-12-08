# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=h2o-2.2
_pkgname=h2o
pkgver=2.2.6
pkgrel=4
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
depends=('libuv' 'libyaml' 'openssl' 'wslay' 'zlib')
makedepends=('gcc' 'bison' 'cmake' 'libtool' 'make' 'pkg-config' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')
source=($_pkgname-$pkgver.tar.gz::https://codeload.github.com/h2o/$_pkgname/tar.gz/v${pkgver/_/-}
        h2o.service)
b2sums=('8474751ca9832ddae2022710654ca58a93ebf9ca01afe934950209b04357b7548b05c598c49fe92684b2910fd6309d6fc3923a0b01cdeeb4b0dc65b08842255f'
        '59b86cec57d06c3754b0634adef46da6b86ce4b251c5f864ab866e94a169ca2ed9357521a9b645ff38ea463ab168b4f07c0104a34945c4f2fb73df837312d5a7')
backup=('etc/h2o.conf')
options=(!lto)
provides=('h2o' 'libh2o')
conflicts=('libh2o' 'h2o' 'h2o-git')

build() {
  cd "$srcdir/$_pkgname-${pkgver/_/-}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_BUNDLED_SSL=off \
    -DWITH_MRUBY=off \
    .
  make
  make libh2o
}

package() {
  cd "$srcdir/$_pkgname-${pkgver/_/-}"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"
  install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"
  make DESTDIR="$pkgdir" install
}
