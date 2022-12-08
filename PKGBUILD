# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=h2o
pkgver=2.3.0_beta2
pkgrel=2
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
depends=('libuv' 'libyaml' 'openssl' 'wslay' 'zlib')
makedepends=('gcc' 'bison' 'cmake' 'libtool' 'make' 'pkg-config' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/h2o/$pkgname/tar.gz/v${pkgver/_/-}
        h2o.service)
b2sums=('a219c1f7ba275755e6b3f07afea2bbb82d5bce823dd37afbbf1a59fd645ce4965fdc760a3d03d4d14718b5bce3eca144e061e0ff7f68eea6b4a841f93ec76ec4'
        '59b86cec57d06c3754b0634adef46da6b86ce4b251c5f864ab866e94a169ca2ed9357521a9b645ff38ea463ab168b4f07c0104a34945c4f2fb73df837312d5a7')
backup=('etc/h2o.conf')
options=(!lto)
provides=('h2o' 'libh2o')
conflicts=('libh2o')

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"

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
  cd "$srcdir/$pkgname-${pkgver/_/-}"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"
  install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"
  make DESTDIR="$pkgdir" install
}
