# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
pkgname=mingw-w64-glib2
pkgver=2.72.1
pkgrel=1
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="https://wiki.gnome.org/Projects/GLib"
source=("git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$pkgver"
  "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch")
sha256sums=('SKIP'
            '38d2a038b39cef7a2452ddf4b04422e17a40745cc9b1fc8297c24320cecca7f9')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0') # Philip Withnall (https://endlessos.org/) <pwithnall@endlessos.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd glib
  # https://gitlab.gnome.org/GNOME/glib/issues/539
  patch -Np1 -i ../0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch
}


build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib/build-${_arch}-static"
    mkdir -p "${srcdir}/glib/build-${_arch}-shared"

    cd "${srcdir}/glib/build-${_arch}-static"
    ${_arch}-meson \
      --default-library static ..
    ninja

    cd "${srcdir}/glib/build-${_arch}-shared"
    ${_arch}-meson \
      --default-library shared ..
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    # fix pkg-config files (see https://github.com/mesonbuild/meson/pull/3939)
    for pc_file in ${srcdir}/glib/build-${_arch}-shared/meson-private/*.pc; do
      sed -i 's/-lgnulib//g' "$pc_file"
      sed -i 's/-lcharset//g' "$pc_file"
      sed -i 's/-lgiowin32//g' "$pc_file"
    done
    
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib/build-${_arch}-static" install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib/build-${_arch}-shared" install
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi

  done
}

# vim: ts=2 sw=2 et:
