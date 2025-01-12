# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="cairomm"
_name="${_basename}-1.16"
pkgname="mingw-w64-${_name}"
pkgver=1.18.0
pkgrel=1
pkgdesc="C++ bindings for Cairo (mingw-w64)"
arch=('any')
url="https://www.cairographics.org/cairomm"
_url="https://gitlab.freedesktop.org/cairo/${_basename}"
license=('LGPL-2.0-or-later AND MPL-1.1')
depends=('mingw-w64-cairo' 'mingw-w64-crt' 'mingw-w64-libsigc++-3.0')
makedepends=('mingw-w64-meson>=0.55' 'mm-common')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('aec941f5b1c25392fec2b079edbd322d54520efc7c6a7a48eef111e14a67ca64')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  # export CPPFLAGS+=" -D_REENTRANT -D_POSIX_SOURCE"
  # export lt_cv_deplibs_check_method='pass_all'

  cd "${srcdir}"
  for _arch in ${_architectures}; do
    mkdir -p "${_pkgsrc}/build-${_arch}"
    ${_arch}-meson "${_pkgsrc}" "${_pkgsrc}/build-${_arch}" \
      -D maintainer-mode=true \
      -D build-documentation=false \
      -D build-examples=false \
      -D build-tests=false
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
