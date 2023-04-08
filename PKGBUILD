# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.4.1
pkgrel=1
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "FixBuildingGlib2.76.patch::https://github.com/gtkd-developers/GlibD/commit/00b0a745a1117034f9474b265a3af6e10af60de3.patch")
sha512sums=('507ba7731fdafa89b5bee1681802df07c48884b04adbb1bcc6cf3d7d60d2e1552cd83bd6652fdfa381a2fd6344aa1cc63caaad37db25527d2cedbad628f085ca'
            '1151cae2e3c937d45fd0c2c6771abd1f891403d4d084e086449b8a3cf07e4c6d21df8dd3c92f659bea400bcad444a12a882cd86e456632dc62f9494237c24880')

prepare() {
  patch -d $_pkgname-$pkgver -p1 -i "$srcdir"/FixBuildingGlib2.76.patch
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
