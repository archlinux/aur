# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gegl
_pkgbase=gegl
pkgver=0.4.32
_commit=5ea11ee00d9061ca2cd61f83ece25dfcfe0e9596 # tags/GEGL_0_4_30
pkgrel=2
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
makedepends=('intltool' 'ruby' 'mesa' 'glu' 'exiv2' 'meson' 'vala'
             'xorgproto' 'shared-mime-info' 'gobject-introspection'
             'lib32-sdl2' 'python-gobject')
source=("git+https://gitlab.gnome.org/GNOME/$_pkgbase.git#commit=$_commit"
        "x86-linux-gnu"
        "sdl2.pc"
        "gegl-openexr3.patch")
sha512sums=('SKIP'
            '0d1cd8d934db76b93ecb85d41badd95800a7bf9b80dfe80c91d457cc778a4604bd0015ef1a05056990d9d80a5a32d23c05d06a2a5102714d2dd01b97947dc5f8'
            '00767b84218d5105d4e3f88f1e43d284ba7f3fbd81204f303e0c245a5d5859f812b32bc61b3faaacb97d7ee7fc509b365bcaa167c849c61f3d95621ca0f8fa51'
            'bc732c99026afd59aaa70bd98622bdedb2173ac3242d4648f6222bc966e60b9f9b2df7360fee3cbdb7240f6758d7382d6986d02a133b203c1e47af3782b7f475')

prepare() {
  for pkg in vapigen.pc gobject-introspection-1.0.pc pygobject-3.0.pc; do
      cp "/usr/lib/pkgconfig/$pkg" "$srcdir/"
  done
  for pkg in xproto.pc kbproto.pc xextproto.pc renderproto.pc shared-mime-info.pc; do
      cp "/usr/share/pkgconfig/$pkg" "$srcdir/"
  done
  cd "$srcdir/$_pkgbase"
  patch -p1 < ../gegl-openexr3.patch
}

build() {
  mkdir -p "build"
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
      --cross-file  x86-linux-gnu
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/"{share,include,bin}
}

