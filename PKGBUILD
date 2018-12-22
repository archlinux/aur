# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
pkgname=mingw-w64-glib2
pkgver=2.58.2
pkgrel=1
_commit=97bcbcb8c2aa0aeee5afd9939efbadbae0c8a8fa  # tags/2.58.2^0
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="https://wiki.gnome.org/Projects/GLib"
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  "0001-win32-Make-the-static-build-work-with-MinGW-when-pos.patch")
sha256sums=('SKIP'
            'ff0d3df5d57cf621cac79f5bea8bd175e6c18b3fbf7cdd02df38c1eab9f40ac3'
            '838abaeab8ca4978770222ef5f88c4b464545dd591b2d532c698caa875b46931')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  # https://gitlab.gnome.org/GNOME/glib/issues/539
  patch -Np1 -i ../0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch
  # https://gitlab.gnome.org/GNOME/glib/issues/692
  patch -Np1 -i ../0001-win32-Make-the-static-build-work-with-MinGW-when-pos.patch
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
    # fix pkg-config files (see https://github.com/mesonbuild/meson/pull/3939)
    for pc_file in ${srcdir}/glib/build-${_arch}/meson-private/*.pc; do
      sed -i 's/-lgnulib//g' "$pc_file"
      sed -i 's/-lcharset//g' "$pc_file"
      sed -i 's/-lgiowin32//g' "$pc_file"
    done
    
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib/build-${_arch}" install
    
    # see https://github.com/mesonbuild/meson/issues/4138
    ${_arch}-gcc-ranlib ${pkgdir}/usr/${_arch}/lib/*.a

  done
}

# vim: ts=2 sw=2 et:
