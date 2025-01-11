# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: David Schury <dasc at posteo dot de>

_name="libsigc++"
pkgname="mingw-w64-${_name}"
pkgver=2.12.1
pkgrel=1
epoch=1
pkgdesc="Callback Framework for C++ (mingw-w64)"
arch=('any')
url="https://libsigcplusplus.github.io/libsigcplusplus"
# _url="https://github.com/libsigcplusplus/libsigcplusplus"
license=('LGPL-3.0-or-later')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-meson>=0.55' 'mm-common')
provides=('mingw-w64-libsigc++2.0')
conflicts=('mingw-w64-libsigc++2.0')
replaces=('mingw-w64-libsigc++2.0')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359bd50843')

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
