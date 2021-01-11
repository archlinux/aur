# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=liblsl
pkgver=v1.14.0
_pkgver=1.14.0
pkgrel=1
pkgdesc='C++ lsl library for multi-modal time-synched data transmission over the local network (stable release)'
arch=('any')
url='https://github.com/sccn/liblsl/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'patchelf')
provides=($pkgname)
conflicts=("${pkgname}-git")
source=("${pkgname}-${_pkgver}::git+ssh://git@github.com/sccn/liblsl.git#tag=${pkgver}")
md5sums=('SKIP')


build() {
    cmake \
        -B "${pkgname}-${_pkgver}/build" \
        -S "${pkgname}-${_pkgver}" \
        -DLSL_UNIXFOLDERS=ON \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C "${pkgname}-${_pkgver}/build"
}

package() {
    mkdir -p "${pkgdir}/opt/LSL/bin"
    mkdir -p "${pkgdir}/opt/LSL/include"
    mkdir -p "${pkgdir}/opt/LSL/lib"
    mkdir -p "${pkgdir}/opt/LSL/share/licenses"
    install -Dm 755 "${pkgname}-${_pkgver}/build/${pkgname}.so.${_pkgver}" "${pkgdir}/usr/lib/${pkgname}.so.${_pkgver}"
    ln -rs -T "${pkgdir}/usr/lib/${pkgname}.so.${_pkgver}" "${pkgdir}/usr/lib/${pkgname}.so"
    ln -rs -T "${pkgdir}/usr/lib/${pkgname}.so" "${pkgdir}/opt/LSL/lib/${pkgname}.so.${_pkgver}"
    ln -rs -T "${pkgdir}/opt/LSL/lib/${pkgname}.so.${_pkgver}" "${pkgdir}/opt/LSL/lib/${pkgname}.so"
    install -Dm 755 "${pkgname}-${_pkgver}/build/LSLConfig.cmake" "${pkgdir}/opt/LSL/LSLConfig.cmake"
    install -Dm 755 "${pkgname}-${_pkgver}/build/LSLTargets.cmake" "${pkgdir}/opt/LSL/LSLTargets.cmake"
    install -Dm 755 "${pkgname}-${_pkgver}/build/LSLCMake.cmake" "${pkgdir}/opt/LSL/LSLCMake.cmake"
    install -Dm 755 "${pkgname}-${_pkgver}/build/LSLConfigVersion.cmake" "${pkgdir}/opt/LSL/LSLConfigVersion.cmake"
    install -Dm 755 "${pkgname}-${_pkgver}/build/CPackConfig.cmake" "${pkgdir}/opt/LSL/CPackConfig.cmake"
    install -Dm 755 "${pkgname}-${_pkgver}/build/CPackSourceConfig.cmake" "${pkgdir}/opt/LSL/CPackSourceConfig.cmake"
    install -Dm 755 "${pkgname}-${_pkgver}/build/lslver" "${pkgdir}/usr/bin/lslver"
    ln -rs -T "${pkgdir}/usr/bin/lslver" "${pkgdir}/opt/LSL/bin/lslver"
    install -Dm 755 "${pkgname}-${_pkgver}/include/lsl_c.h" "${pkgdir}/usr/include/lsl_c.h"
    ln -rs -T "${pkgdir}/usr/include/lsl_c.h" "${pkgdir}/opt/LSL/include/lsl_c.h"
    install -Dm 755 "${pkgname}-${_pkgver}/include/lsl_cpp.h" "${pkgdir}/usr/include/lsl_cpp.h"
    ln -rs -T "${pkgdir}/usr/include/lsl_cpp.h" "${pkgdir}/opt/LSL/include/lsl_cpp.h"
    install -Dm 644 "${pkgname}-${_pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -rs -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/opt/LSL/share/licenses/LICENSE"
}