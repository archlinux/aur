# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>

pkgname=vibe-d
_pkgname=vibe.d
pkgver=0.8.6
pkgrel=8
pkgdesc='High-performance asynchronous I/O, concurrency and web application toolkit'
arch=('x86_64')
url='https://vibed.org'
license=('MIT')
depends=('liblphobos' 'openssl' 'libevent' 'zlib' 'diet-ng' 'd-stdx-allocator')
makedepends=('meson' 'ldc' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vibe-d/vibe.d/archive/v$pkgver.tar.gz")
sha512sums=('4c5960693698349b606a15f7e4e680474b05604e7a18b79890ee91b1e1805818ace916eb4d25727e8ec63ef7243b1f3d3df97be0682c0d785e32341878705ada')

prepare() {
  cd $_pkgname-$pkgver

  # Add missing file
  sed -i "/vibe_http_src =/a 'vibe/http/internal/basic_auth_client.d'," http/meson.build
}

build() {
  mkdir -p $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc

  arch-meson ..

  ninja
}

check() {
  cd $_pkgname-$pkgver/build

  ninja test
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install

  install -Dm 644 ../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

