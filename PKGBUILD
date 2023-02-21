# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.1.14
pkgrel=11
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('393ee409d50c7c825407b19fb860cce21907eb12ae5575eb5cd223bf0d4c3186bf6f0a61d4f3c7d07c6741c9d1d8f9a3421f7735520bba6e4bb52a5c18cb55f1')

prepare() {
  cd $_pkgname-$pkgver

  # Fix version in buildfile
  sed -i "s/1.1.1/$pkgver/" meson.build
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

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
