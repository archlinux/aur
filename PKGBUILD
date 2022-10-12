# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=8.1.0
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=('x86_64')
url='https://llhttp.org'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ts-node' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/v$pkgver.tar.gz")
sha512sums=('363f8b3f8aa743f2529c0738b8b95dd682bacf7bd1afa1fc9b8a1d67251e1ced90b986402939ea484bc2cf511a83819b3def6345885ad59e8854c7c263d999da')
b2sums=('a137d2a63b0a9369b5285ad25637a9e845bc840fd85f32f0e15c93cfd39f82d08df0f983569a4821fd57c03b8e6e90d8e7ada99087ff4a5dfba19c732212389d')

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
