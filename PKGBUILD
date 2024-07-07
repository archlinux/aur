# Maintainer: Dan Printzell <wild@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.4.3
pkgrel=2
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL-3.0-or-later')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"0001-Add-missing-gthread-2.0-dependency.patch")
sha512sums=('7ceb415cad9aa3ea325d561932586b730af7ce123d4f1e69339eb2f007774abfa126d783af898ef7f8c17bde0f337383ba1630fd039f9a22a3c34a98ac8dd539'
            'ee741ec82506da7f653ef68033984e5014ae26f5b3faaaddc75fab9af7556721c3824abe712848b772fcf01da91184e3507d486db7b6c87d129981a0f1593283')

prepare() {
  patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input "$srcdir"/0001-Add-missing-gthread-2.0-dependency.patch
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
