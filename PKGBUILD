# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libunistring
pkgver=1.4.1
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/libunistring/"
license=('LGPL-3.0-or-later OR GPL-2.0-or-later')
depends=('mingw-w64-crt'
         'mingw-w64-libiconv')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz"{,.sig})
sha256sums=('67d88430892527861903788868c77802a217b0959990f7449f2976126a307763'
            'SKIP')
validpgpkeys=('E0FFBD975397F77A32AB76ECB6301D9E1BBEAC08') # Bruno Haible (Free Software Development) <bruno@clisp.org>

build() {
  cd "${srcdir}/libunistring-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-threads=win32
    make DESTDIR="${srcdir}/install-${_arch}" install
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"
    cp -r "install-${_arch}/"* "${pkgdir}"
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm "${pkgdir}/usr/${_arch}/share/info/dir"
  done
}

# vim:set ts=2 sw=2 et:
