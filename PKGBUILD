# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLHF

pkgname=h2o
pkgver=1.4.4
pkgrel=2
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
depends=('libuv' 'libyaml' 'wslay')
makedepends=('cmake' 'make')
url="https://github.com/h2o/h2o"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/h2o/$pkgname/tar.gz/v$pkgver
        h2o.service)
sha256sums=('0297ca73dba460653c6edb14dab17095f60616baf7c51e45ac9f8a6d54b9ba55'
            '63cd9134cdf47ca2b69bb0bf2a4ccd8b4fd3fd5c79e2a791bdec9a8d1691679b')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('libh2o')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_BUNDLED_SSL=on .
  make
  make libh2o
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

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
