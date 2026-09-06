# Maintainer: Dan Printzell <wild@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.4.3
pkgrel=7
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL-3.0-or-later')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"0001-Add-missing-gthread-2.0-dependency.patch"
	"fix-glib-unix-split.patch"
	"fix-gio-unix-split.patch"
	"fix-generated-sources-abspath.patch")
sha512sums=('7ceb415cad9aa3ea325d561932586b730af7ce123d4f1e69339eb2f007774abfa126d783af898ef7f8c17bde0f337383ba1630fd039f9a22a3c34a98ac8dd539'
            'ee741ec82506da7f653ef68033984e5014ae26f5b3faaaddc75fab9af7556721c3824abe712848b772fcf01da91184e3507d486db7b6c87d129981a0f1593283'
            '1171033d8687e24a7fe43f08ca69fa594f0716924e8b712efa6df3d43788dd49a61f68bbb890b1bee52256bec26bfa8a3e26bc55b475d2e96c64445512cbb7d7'
            'c641dfc81775de44567efcb8c37b9008f7bfe69fc739f9f2acf7377d4c1c9426645b65c8a0a282e3042c9e6681d11e54da2350e54613b70d9a687415e4055b45'
            'c851bf1ecc26209237cf698e45595443d969af6189da11f606cbec38a687c6cb356c932a141eec3893fadba5540ef55f07e2eaf272d4d7bc8b76d2704bca7e32')

prepare() {
  patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/0001-Add-missing-gthread-2.0-dependency.patch
  # GLib/Gio split off Unix-specific bindings into new companion .gir
  # files upstream -- see memory/glibd.md
  patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/fix-glib-unix-split.patch
  patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/fix-gio-unix-split.patch
  # meson mishandles bare relative build-tree source paths -- see
  # memory/glibd.md
  patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/fix-generated-sources-abspath.patch
}

build() {
  mkdir -p $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  # Force build with LDC
  export DC=ldc
  # ldc rejects GCC-style "-Wl," LDFLAGS outright -- see memory/glibd.md
  unset LDFLAGS

  arch-meson ..

  ninja
}

check() {
  cd $_pkgname-$pkgver/build

  # tests/gobject/*.d (DClosureTest, ObjectGTest, ValueTest) -- real
  # functional checks of the generated GObject/GLib bindings themselves,
  # not just that they compile. Never wired in before this pkgrel.
  meson test --print-errorlogs
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
