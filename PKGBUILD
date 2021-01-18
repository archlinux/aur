# Maintainer: jakob <grandchild@gmx.net>

_pkgname=capstone
pkgname=mingw-w64-${_pkgname}
pkgver=4.0.2
pkgrel=2
pkgdesc="Lightweight multi-platform, multi-architecture disassembly framework (mingw-w64)"
arch=(any)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(staticlibs !buildflags !strip)
license=(BSD)
url="https://www.capstone-engine.org/"
source=("https://github.com/aquynh/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7c81d798022f81e7507f1a60d6817f63aa76e489aa4e7055255f21a22f5e526a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake -DTHREADSAFE=ON -DBUILD_CLAR=OFF -DSTDCALL=ON ..
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
        find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    done
}
