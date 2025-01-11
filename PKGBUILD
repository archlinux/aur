# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>

_name="cairomm"
pkgname="mingw-w64-${_name}"
pkgver=1.14.5
pkgrel=1
pkgdesc="C++ bindings for Cairo (mingw-w64)"
arch=('any')
url="https://www.cairographics.org/cairomm"
_url="https://gitlab.freedesktop.org/cairo/${_name}"
license=('LGPL-2.0-or-later AND MPL-1.1')
depends=('mingw-w64-cairo' 'mingw-w64-crt' 'mingw-w64-libsigc++')
makedepends=('mingw-w64-meson>=0.55' 'mm-common')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('80c10611888e84c3a660eea0dafc81b6a9faf3e1d1cc31f950c51b3f7d384fc2')

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
