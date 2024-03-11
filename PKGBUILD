# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.4.2
pkgrel=7
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "Trivial_fix_for_GLib_2.78.patch::https://github.com/gtkd-developers/GlibD/commit/ef3b70be9de8e1c798db47b627b465b0a257e693.patch")
sha512sums=('6db52b29cf90a5d8f6ddb43c1ddcd5bcc6ed5b2b6cd575711beffff74b8592c07aa3c6a1047954305cbcd515ef6ea814c162a91c12e9580d5938228ecc7a6d49'
            '7bcbf68b9a069860e81232da4ece4ea3e8f766afcefbb6dcff060e897bdd6dc00c8f045eb5b1547a981b08990b678eb54f22d620e375f1ee469caeb09331e2f7')

prepare() {
  patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/Trivial_fix_for_GLib_2.78.patch
}

build() {
  mkdir -p $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  # Force build with LDC
  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto/-flto=full/')"

  arch-meson ..

  ninja
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
