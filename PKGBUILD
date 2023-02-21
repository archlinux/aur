# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-stdx-allocator
_pkgname=stdx-allocator
pkgver=3.0.2
pkgrel=21
pkgdesc='Extracted std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/stdx-allocator'
license=('Boost')
depends=('liblphobos' 'd-mir-core')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "add-dependency.patch::https://github.com/dlang-community/stdx-allocator/commit/676b4c782ba9c484864075508c27ef44399396f7.patch")
sha512sums=('f4dc887225926cc4530314976e5e236c696a54c6e2ccdb48271b97b0c0a70882b70e92768c94c2932ccc9bd2282c3e953b27cf72088904458f7fc15234dca4be'
            '13d52d3bb4d90e7b5fb3163f1761c20a57a59be1306ac665fea0eb9331864821d77e790f8ca6027b1936a6930085d2ccca7a1d49d4bd139a939e2c58f03bd47a')

prepare() {
  cd $_pkgname-$pkgver

  patch -p1 < ../add-dependency.patch
}

build() {
  mkdir $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto/-flto=full/')"

  arch-meson ..

  ninja
}

check() {
  cd $_pkgname-$pkgver/build

  meson test
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
