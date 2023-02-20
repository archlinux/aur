# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
pkgname=mingw-w64-glib2
pkgver=2.74.5
pkgrel=1
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre2 mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="https://wiki.gnome.org/Projects/GLib"
_commit=39a71aff372ed491a24ca84409d9f93bc7c5d6d4  # tags/2.74.5^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch")
sha256sums=('SKIP'
            '4e4d59c194dcbd9a88ccc0932b9a0e7e48e7480a2b848af24eeb005fa7c9f246')

pkgver() {
  cd glib
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

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
