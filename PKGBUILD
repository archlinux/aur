# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=6.0.9
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('e3c090d6479a76d05698954bb7dee5f20139d67d52a355bd1948219b7646937c5c05d4739c5001803647523a56e4a4fbe4b15498b159a7b15a21a8edbd76916a')
b2sums=('88cec750445f01ae72d34361ac0b4a98aacd3e5fdc9b7109b2ee51dbb599c55926d9145f46e128cae6fb582777b9fd13963af010ab409c202447720c6be7040d')

build() {
  cd "$pkgname-$pkgver"

  # codegen
  npm install
  make release TAG="$pkgver"

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
