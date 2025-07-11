# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.7.3
pkgrel=1
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7daebf776616e9b28ef93420d7598c266b5763347bd3de4f9dbc980eb6a6befef9e1a45d2a5961963f93be779e0993218f60cf31f7f32c2e8a7e54a64ff6f69c')

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
