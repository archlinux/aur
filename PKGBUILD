# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="pangomm"
_name="${_basename}-2.48"
pkgname="mingw-w64-${_name}"
pkgver=2.54.0
pkgrel=1
pkgdesc="C++ bindings for Pango (mingw-w64)"
arch=('any')
url="https://www.gtkmm.org"
license=('LGPL-2.1-or-later')
depends=('mingw-w64-cairomm-1.16' 'mingw-w64-glib2' 'mingw-w64-glibmm-2.68'
         'mingw-w64-libsigc++-3.0' 'mingw-w64-pango')
makedepends=('mingw-w64-meson>=0.62' 'mm-common')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('4a5b1fd1b7c47a1af45277ea82b5abeaca8e08fb10a27daa6394cf88d74e7acf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  # export CPPFLAGS+=" -D_REENTRANT"

  cd "${srcdir}"
  for _arch in ${_architectures}; do
    mkdir -p "${_pkgsrc}/build-${_arch}"
    ${_arch}-meson "${_pkgsrc}" "${_pkgsrc}/build-${_arch}" \
      -D maintainer-mode=true \
      -D build-documentation=false
    meson compile -C "${_pkgsrc}/build-${_arch}"
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    meson install -C "${_pkgsrc}/build-${_arch}" --destdir "${pkgdir}"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" "{}" \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded "{}" \;
    find "${pkgdir}/usr/${_arch}" \( -name '*.a' -o -name '*.dll' \) -exec "${_arch}-strip" -g '{}' ';'
  done
}

# vim: ts=2 sw=2 et:
