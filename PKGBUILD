# Maintainer: Andrew Gunnerson <andrewgunnerson@gmail.com>

pkgname=mingw-w64-lz4
pkgver=131
pkgrel=1
pkgdesc='Very fast lossless compression algorithm (mingw-w64)'
arch=(any)
url='https://github.com/Cyan4973/lz4'
license=(GPL2)
depends=(mingw-w64-crt)
makedepends=(git mingw-w64-cmake)
checkdepends=(wine)
options=(!buildflags staticlibs !strip)
source=("git+https://github.com/Cyan4973/lz4.git#tag=r${pkgver}"
        0001-Windows-build-fixes.patch)
sha512sums=('SKIP'
            'f4f5cd6eecf19ec3a04ae4e5b7321e7d9d187a13b6d25b62c331114038170dd309c1f9f593090655bd110c074fe46c757cc65f35460da9b0c0916d87b8d4b60e')

_mingw_arch=(i686-w64-mingw32 x86_64-w64-mingw32)

prepare() {
    cd lz4
    git am ../0001-Windows-build-fixes.patch
}

build() {
    cd lz4

    for _arch in "${_mingw_arch[@]}"; do
        mkdir -p "build_${_arch}_static"
        pushd "build_${_arch}_static"
        "${_arch}-cmake" \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIB_INSTALL_DIR=lib \
            -DBUILD_SHARED_LIBS=OFF \
            ../cmake_unofficial
        make
        popd

        mkdir -p "build_${_arch}_shared"
        pushd "build_${_arch}_shared"
        "${_arch}-cmake" \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIB_INSTALL_DIR=lib \
            -DBUILD_SHARED_LIBS=ON \
            ../cmake_unofficial
        make
        popd
    done
}

check() {
    unset DISPLAY

    cd lz4

    for _arch in "${_mingw_arch[@]}"; do
        for _type in static shared; do
            pushd "build_${_arch}_${_type}"
            rm -f testfile testfile.lz4 testfile.new
            dd if=/dev/urandom of=testfile bs=1M count=10
            (
                export WINEPREFIX="${srcdir}/temp_wine"
                export WINEPATH="/usr/${_arch}/bin;$(pwd)"
                wine lz4.exe testfile testfile.lz4
                wine lz4.exe -d testfile.lz4 testfile.new
            )
            cmp -s testfile testfile.new
            popd
        done
    done
}

package() {
    cd lz4

    for _arch in "${_mingw_arch[@]}"; do
        for _type in static shared; do
            pushd "build_${_arch}_${_type}"
            make install DESTDIR="${pkgdir}"
            popd
        done

        "${_arch}-strip" --strip-unneeded "${pkgdir}/usr/${_arch}/bin"/*.dll
        "${_arch}-strip" --strip-debug "${pkgdir}/usr/${_arch}/lib"/*.a
    done
}
