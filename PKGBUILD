# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH

pkgname=h2o
pkgver=1.5.0.beta4
pkgrel=2
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
depends=('libuv' 'libyaml' 'wslay' 'zlib')
makedepends=('cmake' 'libtool' 'make' 'pkg-config')
url="https://github.com/h2o/h2o"
license=('MIT')
source=($pkgname-1.5.0-beta4.tar.gz::https://codeload.github.com/h2o/$pkgname/tar.gz/v1.5.0-beta4
        h2o.service)
sha256sums=('d6e31bc90dfd7f99152597d76bd63598ccf5e0b6fda5b6e83a76480610064ae6'
            '8a85462b6798deaaab343b5dae73437e251c5018d70d260a4a4440b9bbb053e6')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('libh2o')

build() {
  cd "$srcdir/$pkgname-1.5.0-beta4"

  msg2 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_BUNDLED_SSL=on .
  make
  make libh2o
}

package() {
  cd "$srcdir/$pkgname-1.5.0-beta4"

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
