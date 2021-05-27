# Maintainer: redtide <redtid3@gmail.com>

_pkgname=carla-bridges-win
pkgname=${_pkgname}-git
pkgver=r6034.62a641017
pkgrel=1
pkgdesc="Carla win32/64 bridges"
arch=("x86_64")
url="https://kx.studio/Applications:Carla"
license=("GPL2")
provides=("${_pkgname}" "carla-bridges-win32" "carla-bridges-win64")
conflicts=("${_pkgname}" "carla-bridges-win32" "carla-bridges-win64")
depends=("mingw-w64-crt" "mingw-w64-winpthreads" "wine" "carla-git")
makedepends=("git" "mingw-w64-gcc" "mingw-w64-pkg-config")
source=("${_pkgname}::git+https://github.com/falkTX/Carla.git")
sha256sums=("SKIP")

_path=$PATH
_cflags=$CFLAGS
_cxxflags=$CXXFLAGS
_ldflags=$LDFLAGS
_ar=$AR
_cc=$CC
_cxx=$CXX
_pkg_config_path=$PKG_CONFIG_PATH
_win32=$WIN32
_win64=$WIN64

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    for _arch in "i686-w64-mingw32" "x86_64-w64-mingw32"; do
        if [[ "${_arch}" == "i686-w64-mingw32" ]]; then _bits=32; else _bits=64; fi
        export AR=${_arch}-ar
        export CC=${_arch}-gcc
        export CXX=${_arch}-g++
        export LDFLAGS="-static"
        export PATH=/usr/${_arch}/bin:$PATH
        export PKG_CONFIG_PATH=/usr/${_arch}/lib/pkgconfig
        export WIN32=true
        if [[ "${_bits}" == 64 ]]; then export WIN64=true; fi
        unset CFLAGS
        unset CXXFLAGS
        unset LDFLAGS
        make win${_bits} HAVE_LIBLO=false

        export PATH=$_path
        export AR=$_ar
        export CC=gcc
        export CXX=$_cxx
        export PKG_CONFIG_PATH=$_pkg_config_path
        export CFLAGS=$_cflags
        export CXXFLAGS=$_cxxflags
        export LDFLAGS=$_ldflags
        export WIN32=$_win32
        export WIN64=$_win64
        export JACKBRIDGE_FLAGS="-D__WIDL_objidl_generated_name_0000000C="
        make wine${_bits}
    done
}
package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/lib/carla"
    mkdir -p "${pkgdir}/usr/lib/lv2/carla.lv2"
    mkdir -p "${pkgdir}/usr/lib/vst/carla.vst"
    cp bin/*.exe "${pkgdir}/usr/lib/carla/"
    cp bin/*.dll "${pkgdir}/usr/lib/carla/"
    cd "${pkgdir}/usr/lib/carla"
    ln -sr *.exe ../lv2/carla.lv2/
    ln -sr *.exe ../vst/carla.vst/
    ln -sr *.dll ../lv2/carla.lv2/
    ln -sr *.dll ../vst/carla.vst/
}
