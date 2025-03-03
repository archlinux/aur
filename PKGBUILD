# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pangomm"
pkgname="mingw-w64-${_name}"
pkgver=2.46.4
pkgrel=1
epoch=1
pkgdesc="C++ bindings for Pango (mingw-w64)"
arch=('any')
url="https://www.gtkmm.org"
license=('LGPL-2.1-or-later')
depends=('mingw-w64-cairomm>=1.2.2' 'mingw-w64-crt' 'mingw-w64-glib2'
         'mingw-w64-glibmm>=2.48' 'mingw-w64-libsigc++' 'mingw-w64-pango>=1.45.1')
makedepends=('mingw-w64-meson>=0.55' 'mm-common')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
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
