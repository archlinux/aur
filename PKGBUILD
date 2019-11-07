# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.0.2
pkgrel=1
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "meson-fixes.patch::https://patch-diff.githubusercontent.com/raw/libmir/mir-core/pull/14.patch")
sha512sums=('fb5d03cbec11927faa4a04e3a6ee70c986813aa259d76cbac8647a3044bb370d3192c7b44e823425e9047b27a556fda8858834be6c0fb3152aac7f72b181205f'
            'f2f3067fb7e4edda492c4d2aed4e10ecd0d028cb332e314684d9d8cd301f37488d081806b4e7119d094fb03b00e29207b3798c27c9b03786fd012673f63928b5')

prepare() {
  cd $_pkgname-$pkgver

  sed "s/dc.get_id() == 'llvm'/false/" "$srcdir"/meson-fixes.patch | patch -p1
}

build() {
  mkdir $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc

  arch-meson ..

  # meson broke -soname for D in the latest update
  sed -i "s/-soname,/=-soname=/g" build.ninja

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

