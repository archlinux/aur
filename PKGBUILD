# Maintainer: osfans <waxaca (at) 163 .dot. com>
_pkgname=miniglog
pkgname=mingw-w64-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc="A logging library based on the miniglog library found in ceres-solver (mingw-w64)"
arch=('any')
url="https://github.com/arpg/miniglog"
license=('GPL')
makedepends=('mingw-w64-cmake' 'git' 'make')
options=('!strip' '!buildflags' 'staticlibs')
source=('miniglog::git+https://github.com/arpg/miniglog.git')
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    #unset LDFLAGS
    cd "$srcdir/$_pkgname"
    for _arch in ${_architectures}; do
        mkdir -p "build-${_arch}-static" && pushd "build-${_arch}-static"
        ${_arch}-cmake -DCMAKE_INSTALL_PREFIX="" -DBUILD_SHARED_LIBS:BOOL=OFF ..
        make
        popd
        mkdir -p "build-${_arch}" && pushd "build-${_arch}"
        ${_arch}-cmake -DCMAKE_INSTALL_PREFIX="" ..
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "$srcdir/$_pkgname"
        pushd "build-${_arch}-static"
            make DESTDIR="${pkgdir}/usr/${_arch}" install
        popd
        pushd "build-${_arch}"
            make DESTDIR="${pkgdir}/usr/${_arch}" install
        popd
        mkdir -p ${pkgdir}/usr/${_arch}/include/$_pkgname
        cp $_pkgname/*.h ${pkgdir}/usr/${_arch}/include/$_pkgname
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
