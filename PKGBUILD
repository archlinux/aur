# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
pkgname=mingw-w64-glib2
pkgver=2.58.0
pkgrel=4
_commit=c138b98e363df8b95c2ee3eac214649b2908ad68 # tags/2.58.0^0
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="https://wiki.gnome.org/Projects/GLib"
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "0001-gsocket-fix-cross-compilation.patch"
  "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  "glib-formaterror.patch"
  "glib-include-time-h-for-localtime_r.patch"
  "glib-prefer-constructors-over-DllMain.patch")
sha256sums=('SKIP'
            '44c8c6b4ca376177a8c333a00c3485d638f8641967503e15364606d4c4292ff3'
            'afd62a852a0b6aed4ce86eb97297e5080b26055cc878413b89d482c184b826b3'
            'ea529d5cbf8cf7ca66467664a3ead37473a1c009ac973d5694b06cc9d0b23df3'
            'ac567f7a9cad51ab97dba70bcdd6c0c16f93d2451c43fde380e4fdb20b2d4b31'
            '8a02502069fa88c667a4fd1599280f927cb1bcf61e9fcd369fec5bdb5440d480')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  patch -Np1 -i ../0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch
  patch -Np1 -i ../glib-prefer-constructors-over-DllMain.patch
  patch -Np1 -i ../glib-formaterror.patch
  patch -Np1 -i ../glib-include-time-h-for-localtime_r.patch
  patch -Np1 -i ../0001-gsocket-fix-cross-compilation.patch
}


build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib/build-${_arch}"
    cd "${srcdir}/glib/build-${_arch}"
    ${_arch}-meson \
      --default-library both ..
    ninja
  done

}

package() {
  for _arch in ${_architectures}; do
    sed -i "s/-lgnulib//g" ${srcdir}/glib/build-${_arch}/meson-private/glib-2.0.pc 
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib/build-${_arch}" install
    
    #FIXME: Ranlib (isn't meson supposed to do this?)
    ${_arch}-gcc-ranlib ${pkgdir}/usr/${_arch}/lib/*.a

  done
}

# vim: ts=2 sw=2 et:
