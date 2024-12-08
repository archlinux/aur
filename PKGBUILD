# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libunistring
pkgver=1.3
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
sha256sums=('f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527'
            'SKIP')
validpgpkeys=('9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D') # Bruno Haible (Open Source Development) <bruno@clisp.org>

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
