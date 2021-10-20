# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=6.0.6
pkgrel=1
pkgdesc="Port of http_parser to llparse"
arch=('x86_64')
url="https://llhttp.org"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('6d621aafcf8b0fcddfb8ceb04b69caa4c79f4b955c9548ee8616290a538fcbdd3b2f1f1d35c6609e03d49de01db2b771a60e38fd7f277dd89b5f1a0abc0c31ae')
b2sums=('155852157c73f1771b474aa8132cd75b0adf89c27407c5c9e048ba773a71852cbb5c3d330e4ec62b7c31d9e81de6ff781f8c3b5b6eae80cf92bb83b7622a390f')

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
