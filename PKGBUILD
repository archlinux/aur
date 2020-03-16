# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gegl
_pkgbase=gegl
pkgver=0.4.22
_commit=14096e785792ef42dbf08510e8093996c611828f  # tags/GEGL_0_4_22^0
pkgrel=1
pkgdesc="Graph based image processing framework (32-bit)"
arch=('x86_64')
url="https://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=('gegl' 'lib32-babl' 'lib32-libspiro' 'lib32-json-glib'
         'lib32-poppler-glib'
         'lib32-libgexiv2' 'lib32-libraw' 'lib32-openexr' 'lib32-pango'
         'lib32-librsvg' 'lib32-libtiff' 'lib32-gdk-pixbuf2'
         'lib32-lensfun' 'lib32-v4l-utils' 'lib32-luajit' 'lib32-sdl2'
         'lib32-suitesparse' 'lib32-libwebp' 'lib32-ffmpeg')
makedepends=('intltool' 'ruby' 'mesa' 'glu' 'exiv2' 'vala' 'gobject-introspection' 'meson' 'python-gobject')
source=("https://gitlab.gnome.org/GNOME/$_pkgbase/-/archive/$_commit/$_pkgbase-$_commit.tar.gz"
        "x86-linux-gnu"
        "pkgconf32")
sha512sums=('ba89ca08feb83804b402098f84094c665ecbb08f3f39b6cbf3a5b65db4c31ad53cd1e7fc5623e8edb9361859da4a03efc9c94d8404714dd8bd51f1c3455c1b53'
            'c90a2e8d8753d4474afbaa5f1def579b4fe9580904b25125e2f942fa722a6ed54340e467d2ddf60ab9d3aeeeb93f5f740502cafe9a1f52d55da3bd78baa3b5c5'
            'f704e11f3054312e35974194af845e00fdc795aa97e82d425fb52ff8e628702926551b583f0354f9f9e7eafeb71c7f348c288457ff19a8c4807c58f637d0d946')

prepare() {
  cp "/usr/lib/pkgconfig/vapigen.pc" \
     "/usr/lib/pkgconfig/gobject-introspection-1.0.pc" \
     "/usr/lib/pkgconfig/pygobject-3.0.pc" \
     "$srcdir/"
}

build() {
  mkdir -p "build"
  arch-meson "${_pkgbase}-$_commit" "build" -Dworkshop=true -Dmrg=disabled --cross-file x86-linux-gnu --libdir=/usr/lib32
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/"{share,include,bin}
}

