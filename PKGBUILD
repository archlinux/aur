# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.23.0
pkgrel=1
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL3')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "FixGLib2.76.patch::https://github.com/gtkd-developers/gir-to-d/commit/7a7e5845dc74ac1ef845770e629730560ee3b69a.patch")
sha512sums=('d481bf9734c7362122af4ef82db9ff06876c1172f7de8bd9d4505be4ddd47452e01e3e4ecdefa0f9158ab720cb69f1a5d8e5e120c3a50b4d962a8fd6b80afdc7'
            'bff351dba2ad2568ec014fe6ca0cf4bb04e3fcdacd228a3402bdd3679a4310d634ab50d6c2b7cb032316da7e484fa6d6953a7870257b8860861e8f2b291af941')

prepare() {
  patch -d $pkgname-$pkgver -p1 -i "$srcdir"/FixGLib2.76.patch
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
