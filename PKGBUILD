# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=6.0.7
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('ac6f3f0f68d61f3513bd3bc960c13641f02cc28f5a35fce5db4040a63a07835bcc82fb705680dc94e516662ff68699dd7aac6be4ed9bf321d91ba8b8cf720d5b')
b2sums=('c69298d955c5d47009a5174aaab7ce91f0d474877e32f8b1299c9580fda7d61c08107de681021bea284012a5bcf3464bc08a361c64294e1e729f0a325d97518e')

build() {
  cd "$pkgname-$pkgver"

  # codegen
  npm install
  make release

  # build
  cmake -B ../build -S release \
    -DBUILD_SHARED_LIBS=on \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -C ../build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE-MIT"
}
