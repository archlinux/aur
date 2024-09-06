# Maintainer: Marcus Ben Spencer <marcus@marcusspencer.xyz>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=9.2.1
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('653a0d65226644a7d71c538da343b2cff75bc7acc8cd6473ac19d166cc77c3e00c6a9087120d9abb63a9ac6b50e408c905d5925fa96d5d46d425ee7d0e3cdf9c')
b2sums=('5016e6cc7b4cd313ffcfb02ea2b8c8530510020b5727346236b4f8477ac1daca73883d99230fe312b688d5d8cb5252d5ef7e11bb4f914186e069f001c95ac401')

build() {
  cd "$pkgname-$pkgver"

  # codegen
  npm install
  make release RELEASE="$pkgver"

  # build
  cmake -B ../build -S release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -C ../build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE-MIT"
}
