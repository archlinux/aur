# Maintainer:
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.7.1
pkgrel=1
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d6e209201a86256ad3ce1d3913425d96a61b7e4536b2ea731e8b6bfa8fe714d84421da186d9573fbbd018dffde7004122754d796cacae0396bc5d968b2a87474')

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
