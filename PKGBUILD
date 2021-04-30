# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gegl
_pkgbase=gegl
pkgver=0.4.30
_commit=5ea11ee00d9061ca2cd61f83ece25dfcfe0e9596 # tags/GEGL_0_4_30
pkgrel=1
pkgdesc="Graph based image processing framework (32-bit)"
arch=('x86_64')
url="https://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=("gegl=$pkgver"
         'lib32-babl' 'lib32-libspiro' 'lib32-json-glib'
         'lib32-poppler-glib'
         'lib32-libgexiv2' 'lib32-libraw' 'lib32-openexr'
         'lib32-librsvg' 'lib32-libtiff'
         'lib32-lensfun' 'lib32-luajit'
         'lib32-jasper'
         'lib32-suitesparse' 'lib32-ffmpeg')
makedepends=('intltool' 'ruby' 'mesa' 'glu' 'exiv2' 'vala' 'gobject-introspection' 'meson' 'python-gobject')
source=("https://gitlab.gnome.org/GNOME/$_pkgbase/-/archive/$_commit/$_pkgbase-$_commit.tar.gz"
        "x86-linux-gnu"
        "gegl-openexr3.patch"
        "pkgconf32")
sha512sums=('0fb5325208fc07bf802fab5d32488ad3e0447a71a9c7447687ad37d479f52924167d49ee579ede48599bdede9644322e25178f620cc0a8f5dad9f51c75907121'
            'c90a2e8d8753d4474afbaa5f1def579b4fe9580904b25125e2f942fa722a6ed54340e467d2ddf60ab9d3aeeeb93f5f740502cafe9a1f52d55da3bd78baa3b5c5'
            'bc732c99026afd59aaa70bd98622bdedb2173ac3242d4648f6222bc966e60b9f9b2df7360fee3cbdb7240f6758d7382d6986d02a133b203c1e47af3782b7f475'
            'f704e11f3054312e35974194af845e00fdc795aa97e82d425fb52ff8e628702926551b583f0354f9f9e7eafeb71c7f348c288457ff19a8c4807c58f637d0d946')

prepare() {
  cp "/usr/lib/pkgconfig/vapigen.pc" \
     "/usr/lib/pkgconfig/gobject-introspection-1.0.pc" \
     "/usr/lib/pkgconfig/pygobject-3.0.pc" \
     "$srcdir/"
  cd "$srcdir/$_pkgbase-$_commit"
  patch -p1 < ../gegl-openexr3.patch
}

build() {
  mkdir -p "build"
  arch-meson "${_pkgbase}-$_commit" "build" -Dworkshop=true -Dmrg=disabled -Dmaxflow=disabled --cross-file x86-linux-gnu --libdir=/usr/lib32
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/"{share,include,bin}
}

