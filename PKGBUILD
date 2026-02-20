# Maintainer: Dan Printzell <wild@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.23.4
pkgrel=3
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL-3.0-or-later')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"add-main-context-pusher.patch::https://gitlab.alpinelinux.org/alpine/aports/-/raw/c461e10b77635f71803e52b3c681a5de91f9c78f/community/gir-to-d/add-main-context-pusher.patch")
sha512sums=('2f35445f3f59c24990c1c76fd4e7cebe1c7bdbf6596d48d316507423af7234bbfd6b61d163aec64f6ceea6d738a8eb7e71097abff8b40c072e4f9cee83a70716'
            '0df0def246e355099f05f34ac0efba205933c1db969ffd13098f89126ffea157a1fedbb67a94b23d19670ac409b1b53f93e4a8fdaf73d8316390c2542d0d5db4')

prepare() {
  # https://github.com/gtkd-developers/gir-to-d/issues/46#issuecomment-2880529179
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/add-main-context-pusher.patch
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
