# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=8.0.0
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('5ba241ab8f28782ea78d7132dbe25cd6fec6bf62622f3ec9794d668be7f9cc1ba48f516c54596e2716721747723623218ba175351fcea5edaa820bf89fa57e53')
b2sums=('01dc8c465fbb00a1e8b56cf30ff873d48cf3d8e353255b2f67aa113d006cc0d503da86242e8fdc7497e45bc6ac265abb50853a095e830cf8bcb3cd59b6d979ff')

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
