# Maintainer: jakob <grandchild@gmx.net>

_pkgname=capstone
pkgname=mingw-w64-${_pkgname}
pkgver=5.0.3
pkgrel=1
pkgdesc="Lightweight multi-platform, multi-architecture disassembly framework (mingw-w64)"
arch=(any)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(staticlibs !buildflags !strip)
license=(BSD)
url="https://www.capstone-engine.org/"
source=("https://github.com/aquynh/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3970c63ca1f8755f2c8e69b41432b710ff634f1b45ee4e5351defec4ec8e1753')

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
