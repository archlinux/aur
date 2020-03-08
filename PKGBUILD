# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('86695f0c5be38027d12bfc619e51bc091b7e2357f871a428ad4ad9060f80d8e4e44613303103e3753ab6178330ac9ea126dd86ffb19e3b6f3ea97cba8f12eb3a')

prepare() {
  cd $_pkgname-$pkgver

  # Fix version in buildfile
  sed -i "s/1.0.2/$pkgver/" meson.build
  # Fix soname
  sed -i "s/dc.get_id() == 'llvm'/false/" meson.build
}

build() {
  mkdir $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc

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

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

