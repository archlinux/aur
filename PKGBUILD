# Maintainer: redtide <redtid3@gmail.com>

_pkgname=carla-bridges-win
pkgname=${_pkgname}-git
pkgver=r5773.c14ec23ab
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
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    for _arch in "i686-w64-mingw32" "x86_64-w64-mingw32"; do
        if [[ "${_arch}" == "i686-w64-mingw32" ]]; then _bits=32; else _bits=64; fi
        make win${_bits} \
            AR=${_arch}-ar \
            CC=${_arch}-gcc \
            CXX=${_arch}-g++ \
            LDFLAGS="-static" \
            PATH=/usr/${_arch}/bin:$PATH \
            PKG_CONFIG_PATH=/usr/${_arch}/lib/pkgconfig
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
