pkgname=mingw-w64-libinih
pkgver=56
pkgrel=1
pkgdesc="'A simple .INI file parser written in C (mingw-w64)"
arch=('any')
url="https://github.com/benhoyt/inih"
license=("BSD")
makedepends=('mingw-w64-meson')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/benhoyt/inih/archive/refs/tags/r${pkgver}.tar.gz")
sha256sums=('4f2ba6bd122d30281a8c7a4d5723b7af90b56aa828c0e88256d7fceda03a491a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/inih-r${pkgver}
}

build() {
  cd "${srcdir}"/inih-r${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Ddistro_install=true -Dwith_INIReader=true
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd "${srcdir}"/inih-r${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
