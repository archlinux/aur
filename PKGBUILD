# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="libsigc++"
_name="${_basename}-3.0"
pkgname="mingw-w64-${_name}"
pkgver=3.6.0
pkgrel=1
pkgdesc="Callback Framework for C++ (mingw-w64)"
arch=('any')
url="https://libsigcplusplus.github.io/libsigcplusplus"
# _url="https://github.com/libsigcplusplus/libsigcplusplus"
license=('LGPL-3.0-or-later')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-meson>=0.55' 'mm-common')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229080e17')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    mkdir -p "${_pkgsrc}/build-${_arch}"
    ${_arch}-meson "${_pkgsrc}" "${_pkgsrc}/build-${_arch}" \
      -D maintainer-mode=true \
      -D build-documentation=false \
      -D validation=false \
      -D build-pdf=false \
      -D build-examples=false \
      -D build-tests=false \
      -D benchmark=false
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
