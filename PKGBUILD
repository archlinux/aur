# Maintainer: Dan Printzell <wild@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.23.2
pkgrel=2
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('14a2f1da71d1c48e6e2dfcf91937d546db56c7ca1bf1a3d0f52b76d9bc4bd8f1b26d227a7d736ec3e53998ccde0a9129a9c596e2c5f71cd54726bf006619e89d')

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
