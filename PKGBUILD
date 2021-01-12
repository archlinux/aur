# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=liblsl
pkgver=1.14.0
_pkgver=v1.14.0
pkgrel=1
pkgdesc='C++ lsl library for multi-modal time-synched data transmission over the local network (stable release)'
arch=('any')
url='https://github.com/sccn/liblsl/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'patchelf')
provides=($pkgname)
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}::git+ssh://git@github.com/sccn/liblsl.git#tag=${_pkgver}")
md5sums=('SKIP')


build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLSL_UNIXFOLDERS:BOOL='ON' \
        -Wno-dev
    make -C "${pkgname}-${pkgver}/build" all
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install

    mkdir -p "${pkgdir}/opt/LSL/bin"
    mkdir -p "${pkgdir}/opt/LSL/include/lsl"
    mkdir -p "${pkgdir}/opt/LSL/lib"
    mkdir -p "${pkgdir}/opt/LSL/share/licenses"

    ln -rsT "${pkgdir}/usr/bin/lslver" "${pkgdir}/opt/LSL/bin/lslver"
    ln -rsT "${pkgdir}/usr/include/lsl_c.h" "${pkgdir}/opt/LSL/include/lsl_c.h"
    ln -rsT "${pkgdir}/usr/include/lsl_cpp.h" "${pkgdir}/opt/LSL/include/lsl_cpp.h"
    ln -rsT "${pkgdir}/usr/include/lsl/common.h" "${pkgdir}/opt/LSL/include/lsl/common.h"
    ln -rsT "${pkgdir}/usr/include/lsl/inlet.h" "${pkgdir}/opt/LSL/include/lsl/inlet.h"
    ln -rsT "${pkgdir}/usr/include/lsl/outlet.h" "${pkgdir}/opt/LSL/include/lsl/outlet.h"
    ln -rsT "${pkgdir}/usr/include/lsl/resolver.h" "${pkgdir}/opt/LSL/include/lsl/resolver.h"
    ln -rsT "${pkgdir}/usr/include/lsl/streaminfo.h" "${pkgdir}/opt/LSL/include/lsl/streaminfo.h"
    ln -rsT "${pkgdir}/usr/include/lsl/types.h" "${pkgdir}/opt/LSL/include/lsl/types.h"
    ln -rsT "${pkgdir}/usr/include/lsl/xml.h" "${pkgdir}/opt/LSL/include/lsl/xml.h"
    ln -rsT "${pkgdir}/usr/lib/${pkgname}.so.${pkgver}" "${pkgdir}/opt/LSL/lib/${pkgname}.so.${pkgver}"
    ln -rsT "${pkgdir}/opt/LSL/lib/${pkgname}.so.${pkgver}" "${pkgdir}/opt/LSL/lib/${pkgname}.so" 

    install -D -m644 "${pkgdir}/usr/share/LSL/LSLCMake.cmake" -t "${pkgdir}/opt/LSL/LSLCMake.cmake"
    install -D -m644 "${pkgdir}/usr/share/LSL/LSLConfig.cmake" -t "${pkgdir}/opt/LSL/LSLConfig.cmake"
    install -D -m644 "${pkgdir}/usr/share/LSL/LSLConfigVersion.cmake" -t "${pkgdir}/opt/LSL/LSLConfigVersion.cmake"
    install -D -m644 "${pkgdir}/usr/share/LSL/LSLTargets-none.cmake" -t "${pkgdir}/opt/LSL/LSLTargets-none.cmake"
    install -D -m644 "${pkgdir}/usr/share/LSL/LSLTargets.cmake" -t "${pkgdir}/opt/LSL/LSLTargets.cmake"
}