# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.3.0
pkgrel=8
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "FixBuildingGlib2.68.patch::https://github.com/gtkd-developers/GlibD/commit/b22a87ee6f42806aff5f9173a24cd05995db6cb0.patch"
        "FixBuildingGlib2.70.patch::https://github.com/gtkd-developers/GlibD/commit/31cc330d1502084f25b207ba0f6c9a26126b5f20.patch"
        "FixBuildingGlib2.72.patch::https://github.com/gtkd-developers/GlibD/commit/ff1daa7c1206c632ef4cba1dc92f35e4c4fdc440.patch")
sha512sums=('3312eb81f6a586be4755942c23f46b23144c7ca5239a187eb30917f8e1c6726a63ecdfbe408276502f688f39dfb0f281248905a88692ec7d79875af53f893455'
            '39e4eaba9fe01ae072e9c179b3e132bd241c94339ca31a47e64cda460aa9cd2ba2b59c8c25e0fb095386b10d83a033b1860afe8ca82e4a2076934a96a4a94012'
            'f4efb17d38e06ed78a0dbd9e565ba987717ff40f9443f55cc7120ff721d9b3ed1fc23b249afac475fd5ed044001fb6b20e4cbd5864ab7f2a9c5c39f70cb51b3e'
            '73d9c6a33a561dd9ff817830bca81e51cd1999b6c44bf516afb9e72d0a7e2e9091c4aa4814a315fd4ba304898082a55c35ef8e8376a99452bdf304f7289291c9')

prepare() {
  patch -d $_pkgname-$pkgver -p1 -i "$srcdir"/FixBuildingGlib2.68.patch
  patch -d $_pkgname-$pkgver -p1 -i "$srcdir"/FixBuildingGlib2.70.patch
  patch -d $_pkgname-$pkgver -p1 -i "$srcdir"/FixBuildingGlib2.72.patch
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
