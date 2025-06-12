# Maintainer: Dan Printzell <wild@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.23.4
pkgrel=1
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('2f35445f3f59c24990c1c76fd4e7cebe1c7bdbf6596d48d316507423af7234bbfd6b61d163aec64f6ceea6d738a8eb7e71097abff8b40c072e4f9cee83a70716')

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
