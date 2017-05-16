# Maintainer: osfans <waxaca (at) 163 .dot. com>
_pkgname=opencc
pkgname=mingw-w64-$_pkgname
pkgver=1.0.5
pkgrel=1
pkgdesc="Library for Open Chinese Convert (mingw-w64)"
arch=('any')
url=" https://github.com/BYVoid/OpenCC"
license=('GPL')
makedepends=('mingw-w64-cmake' 'make')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/BYVoid/OpenCC/archive/ver.${pkgver}.tar.gz")
md5sums=('229792990e669b4ebec119424371d65d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
subdir=OpenCC-ver.$pkgver
build() {
    cd "$srcdir/$subdir"
    sed -i "s/^void ConvertDictionary/OPENCC_EXPORT void ConvertDictionary/" src/DictConverter.hpp
    sed -i "s/ \${OPENCC_DICT_BIN}/ \${CMAKE_CROSSCOMPILING_EMULATOR} ..\/src\/tools\/opencc_dict.exe/" data/CMakeLists.txt
    for _arch in ${_architectures}; do
        mkdir -p "build-${_arch}-static" && pushd "build-${_arch}-static"
        ${_arch}-cmake -DBUILD_SHARED_LIBS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release ..
        make -j8 libopencc
        popd
        mkdir -p "build-${_arch}" && pushd "build-${_arch}"
        ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release ..
        make -j8
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "$srcdir/$subdir"
        pushd "build-${_arch}"
            make DESTDIR="${pkgdir}" install
        popd
        cp build-${_arch}/src/libopencc.dll ${pkgdir}/usr/${_arch}/bin/
        cp build-${_arch}-static/src/libopencc.a ${pkgdir}/usr/${_arch}/lib/
        ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.exe
        ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
        ln -s libopencc.dll ${pkgdir}/usr/${_arch}/bin/opencc.dll
    done
}
