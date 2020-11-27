# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
pkgname=mingw-w64-glib2
pkgver=2.66.3
pkgrel=1
_commit=30c06eb5fc5c1d6b992c144ebf8ae540d99b2fd2  # tags/2.66.3^0
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="https://wiki.gnome.org/Projects/GLib"
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  "glib-prefer-constructors-over-DllMain.patch")
sha256sums=('SKIP'
            'f24badc8897bdcf36949f4eef0a0c6e2c26823e8f0400b4dd44a5553f4bdfae0'
            '3c9848916492435852e4e27bee608a0b2146e146c40f889d725acffd9409aae8')

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
  patch -Np1 -i ../glib-prefer-constructors-over-DllMain.patch
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
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi

  done
}

# vim: ts=2 sw=2 et:
