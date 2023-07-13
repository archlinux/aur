# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gegl
_pkgbase=gegl
pkgver=0.4.46
_commit=e6cb97763e422d8853fc95c665f8b0c73f025dd8  # tags/GEGL_0_4_46
pkgrel=2
pkgdesc="Graph based image processing framework (32-bit)"
arch=('x86_64')
url="https://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=("gegl>=$pkgver"
         'lib32-babl' 'lib32-libspiro' 'lib32-json-glib'
         'lib32-poppler-glib'
         'lib32-libgexiv2' 'lib32-openexr'
         'lib32-librsvg' 'lib32-libtiff'
         'lib32-lensfun' 'lib32-luajit'
         'lib32-suitesparse'
         'lib32-ffmpeg' 'ffmpeg')
makedepends=('intltool' 'ruby' 'mesa' 'glu' 'exiv2' 'meson'
             'xorgproto' 'shared-mime-info' 'lib32-sdl2')
source=("git+https://gitlab.gnome.org/GNOME/$_pkgbase.git#commit=$_commit"
        "x86-linux-gnu")
sha512sums=('SKIP'
            '97c193bdf744a8853b4463dd9f995faea0e8b269b1b7ef3b9ffcf10c173aa44a0e6edcda5cb69be71af8a4a649332cb841ac5849ea8256f0cfeb5a3cedea251c')

prepare() {
  for pkg in xproto.pc kbproto.pc xextproto.pc renderproto.pc shared-mime-info.pc; do
      cp "/usr/share/pkgconfig/$pkg" "$srcdir/"
  done
}

build() {
  mkdir -p "build"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  meson setup \
      "${_pkgbase}" "build" \
      --prefix      /usr \
      --sbindir     bin \
      --buildtype   plain \
      --libexecdir  lib32 \
      --libdir      /usr/lib32 \
      --auto-features enabled \
      --wrap-mode     nodownload \
      -Db_lto=true -Db_pie=true \
      -Dworkshop=true -Dmrg=disabled -Dmaxflow=disabled \
      -Dlibraw=disabled -Ddocs=false -Dintrospection=false \
      -Djasper=disabled \
      --cross-file  x86-linux-gnu
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/"{share,include,bin}
}

