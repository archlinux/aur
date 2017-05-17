# $Id$
# Maintainer: osfans <waxaca at 163 dot com>

_pkgname=librime
pkgname=mingw-w64-$_pkgname-git
pkgver=r1160.939893c0
pkgrel=1
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-boost' 'mingw-w64-opencc' 'mingw-w64-yaml-cpp' 'mingw-w64-leveldb' 'mingw-w64-google-glog' 'mingw-w64-marisa' 'mingw-w64-libiconv')
makedepends=('mingw-w64-cmake' 'git')
source=("git+https://github.com/rime/librime.git")
sha512sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
    cd $srcdir/$_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    for _arch in ${_architectures}; do
        ${_arch}-cmake -Bbuild-${_arch}-static -DBUILD_SHARED_LIBS:BOOL=OFF -H.
        make -C build-${_arch}-static rime-static
        ${_arch}-cmake -Bbuild-${_arch} -H.
        make -C build-${_arch}
    done
}

package() {
    cd "$_pkgname"
    for _arch in ${_architectures}; do
        make -C build-${_arch}-static DESTDIR="$pkgdir" install
        make -C build-${_arch} DESTDIR="$pkgdir" install
        mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
