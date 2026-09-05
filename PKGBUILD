# Maintainer: Dan Printzell <wild@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.23.4
pkgrel=4
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL-3.0-or-later')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"add-main-context-pusher.patch::https://gitlab.alpinelinux.org/alpine/aports/-/raw/c461e10b77635f71803e52b3c681a5de91f9c78f/community/gir-to-d/add-main-context-pusher.patch"
	"fix-inout-linkedhashmap.patch")
sha512sums=('2f35445f3f59c24990c1c76fd4e7cebe1c7bdbf6596d48d316507423af7234bbfd6b61d163aec64f6ceea6d738a8eb7e71097abff8b40c072e4f9cee83a70716'
            '0df0def246e355099f05f34ac0efba205933c1db969ffd13098f89126ffea157a1fedbb67a94b23d19670ac409b1b53f93e4a8fdaf73d8316390c2542d0d5db4'
            'd8d67894fc1bccde65b610786ac8a4dd785edd41d88502501f032c46a329e5a1f6428f54aa22ad1e47c22567d9c0f75564959680bb68cbfb8a3758c61cdecbeb')

prepare() {
  # https://github.com/gtkd-developers/gir-to-d/issues/46#issuecomment-2880529179
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/add-main-context-pusher.patch
  # dmd/ldc regression: inout can't be a struct field -- see memory/gir-to-d.md
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/fix-inout-linkedhashmap.patch
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  export DC=ldc
  # ldc rejects GCC-style "-Wl," LDFLAGS outright -- see memory/gir-to-d.md
  unset LDFLAGS
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
