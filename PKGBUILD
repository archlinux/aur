# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=6.0.10
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('b417fe97467404426c673a6e0303a92b8c3420c6c2bc44bbea6398112879b860ab439119f9d07cfa782a329e42cb9a6d566bf02f147cdfce007527a580acad28')
b2sums=('d62acc24ed0e988a1b4cbc957d38788bcbecaa80fb52cb260e1a83fb66e14ae1191c9ff2174caa328ef64208c7769a24494e1d2e3d992d38e02582586a82e8e1')

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
