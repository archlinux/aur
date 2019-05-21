# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libunistring
pkgver=0.9.10
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/libunistring/"
license=('GPL')
depends=('mingw-w64-crt'
         'mingw-w64-libiconv')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz"{,.sig})
sha256sums=('eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7'
            'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno <ueno@gnu.org>

build() {
  cd "${srcdir}/libunistring-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-threads=win32
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libunistring-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm "${pkgdir}/usr/${_arch}/share/info/dir"
  done
}

# vim:set ts=2 sw=2 et:
