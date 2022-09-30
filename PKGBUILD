# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=7.0.0
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('1d100e2c9aa7d46d13b800ae30b4afef2b16dc36025c2c9f7d73312c2c4a74f1ed9dc804b19402b08192d2905407f6f8bc16fdc6be8ab164a89e27bcca9e0f84')
b2sums=('ae015d2b67d6dc6503112a8cfc3b61a27922cd98f4d98742a52972952525049b2f33a83430d3aa3d5388dedc186de682497c2598a28d703ba214d3222917bb39')

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
