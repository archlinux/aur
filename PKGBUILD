# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-glib2
pkgver=2.82.3
pkgrel=1
arch=(any)
pkgdesc="Low level core library"
url="https://gitlab.gnome.org/GNOME/glib"
license=(LGPL-2.1-or-later)
depends=(mingw-w64-libffi mingw-w64-pcre2 mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-meson python-packaging git)
options=(!strip !buildflags staticlibs !emptydirs)
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch
)
b2sums=('9abb7878311f0df50affd3e308aa157ff711e8789e9f12b6b95f9cab198e3d662528fa1f8a48d5e489bfb1925886e9c5b1bcc5161d65e6323d04c5f3351df831'
        'SKIP'
        '8d6cc5d4d321bb861b6acb86d796a4646f2c5b0a4b4fa54ddda750cbf523de8521edaa7da2595addbe8a3c8ba66020cf4c7c9cbf8ad263515b36808e5b354f57')
validpgpkeys=(
  53EF3DC3B63E2899271BD26322E8091EEA11BBB7 # Emmanuele Bassi <ebassi@gnome.org>
  923B7025EE03C1C59F42684CF0942E894B2EAFA0 # Philip Withnall <pwithnall@gnome.org>
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd glib
  # https://gitlab.gnome.org/GNOME/glib/issues/539
  patch -Np1 -i ../0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update
}


build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib/build-${_arch}-static"
    mkdir -p "${srcdir}/glib/build-${_arch}-shared"

    cd "${srcdir}/glib/build-${_arch}-static"
    ${_arch}-meson \
      -D strip=true \
      -D man=false \
      -D gtk_doc=false \
      --default-library static ..
    meson compile

    cd "${srcdir}/glib/build-${_arch}-shared"
    ${_arch}-meson \
      -D strip=true \
      -D man=false \
      -D gtk_doc=false \
      --default-library shared ..
    meson compile
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
    
    DESTDIR="${pkgdir}" meson install -C "${srcdir}/glib/build-${_arch}-static"
    DESTDIR="${pkgdir}" meson install -C "${srcdir}/glib/build-${_arch}-shared"
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi

  done
}

# vim: ts=2 sw=2 et:
