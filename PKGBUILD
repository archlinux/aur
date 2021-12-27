# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
pkgname=mingw-w64-glib2
pkgver=2.70.2
pkgrel=1
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="https://wiki.gnome.org/Projects/GLib"
source=("git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$pkgver"
  "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  "glib-prefer-constructors-over-DllMain.patch")
sha256sums=('SKIP'
            'c2fa65ddf9cdef61107c0c414997a1a2ec17212303b73b93b2503cb8a0cb9f5d'
            '3c9848916492435852e4e27bee608a0b2146e146c40f889d725acffd9409aae8')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0') # Philip Withnall (https://endlessos.org/) <pwithnall@endlessos.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
