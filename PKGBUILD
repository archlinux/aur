# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.22.0
pkgrel=9
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL3')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "FixSegfault.patch::https://github.com/gtkd-developers/gir-to-d/commit/f4dfc8cfb130280291db458629ab11b6904e5191.patch")
sha512sums=('18a06884153c4ec7c028a2ad492bf272500e3e4079ae7c3eba6188f7681377edde2fe0cbcacedaa757aa6ed5bcf5f1ba2d201093d6f31111692a0162b44c77d6'
            'c4787554476a2328d10c2db78053241173bf2a0a4c55db092eca1da77012e0bf7e8fbec395aef64efb9b04c81e299ba9c6126e010e318f153d8e80abacb8a354')

prepare() {
  patch -d $pkgname-$pkgver -p1 -i "$srcdir"/FixSegfault.patch
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto/-flto=full/')"
  # Instanciate all templates. Fixes:
  # undefined reference to `_D6object__T8opEqualsTxC3gtd11GirFunctionQnTxQwZQBkFxQBexQBiZb'
  export DFLAGS="--allinst"

  arch-meson ..

  ninja
}

package() {
  cd $pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
