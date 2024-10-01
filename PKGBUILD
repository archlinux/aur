# Maintainer: Danny Holman <dholman@gymli.org>

_pkgname=cglm
pkgname="mingw-w64-${_pkgname}"
pkgver=0.9.2
pkgrel=1
pkgdesc="OpenGL Mathematics (glm) for C (mingw-w64)"
arch=('any')
url="https://github.com/recp/cglm"
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/recp/cglm/archive/v$pkgver.tar.gz")
md5sums=('c7a571da4f5c3738d167c2bc5233b304')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
        for _arch in ${_architectures}; do
                rm -rf "${srcdir}/build-${_arch}"
                mkdir "${srcdir}/build-${_arch}"
                cd "${srcdir}/build-${_arch}"

                ${_arch}-cmake "${srcdir}/$_pkgname-$pkgver"    \
                        -DCMAKE_INSTALL_PREFIX=/usr/${_arch}    \
                        -DCMAKE_BUILD_TYPE=Release
                make
        done
}

package() {
        for _arch in ${_architectures}; do
                cd "${srcdir}/build-${_arch}"
                make DESTDIR="${pkgdir}" install
                ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/*.a
                ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
        done
}
