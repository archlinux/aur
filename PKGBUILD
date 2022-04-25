# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=liblsl
pkgver=1.16.0
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc='C++ lsl library for multi-modal time-synched data transmission over the local network (stable release)'
arch=('any')
url='https://github.com/sccn/liblsl/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'patchelf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}::git+https://github.com/sccn/liblsl.git#tag=${_pkgver}")
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
    make -C "${pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install

    mkdir -p "${pkgdir}/opt/LSL/bin"
    mkdir -p "${pkgdir}/opt/LSL/include/lsl"
    mkdir -p "${pkgdir}/opt/LSL/lib"
    mkdir -p "${pkgdir}/opt/LSL/share/licenses"
    mkdir -p "${pkgdir}/usr/share/LSL/licenses"

    ln -rs "${pkgdir}/usr/bin/lslver" -t "${pkgdir}/opt/LSL/bin"
    ln -rs "${pkgdir}/usr/include/lsl_c.h" -t "${pkgdir}/opt/LSL/include"
    ln -rs "${pkgdir}/usr/include/lsl_cpp.h" -t "${pkgdir}/opt/LSL/include"
    ln -rs "${pkgdir}/usr/include/lsl/common.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rs "${pkgdir}/usr/include/lsl/inlet.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rs "${pkgdir}/usr/include/lsl/outlet.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rs "${pkgdir}/usr/include/lsl/resolver.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rs "${pkgdir}/usr/include/lsl/streaminfo.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rs "${pkgdir}/usr/include/lsl/types.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rs "${pkgdir}/usr/include/lsl/xml.h" -t "${pkgdir}/opt/LSL/include/lsl"
    ln -rsT "${pkgdir}/usr/lib/${pkgname}.so.${pkgver}" "${pkgdir}/opt/LSL/lib/${pkgname}.so.${pkgver}"
    ln -rsT "${pkgdir}/opt/LSL/lib/${pkgname}.so.${pkgver}" "${pkgdir}/opt/LSL/lib/${pkgname}.so"

    install -Dm644 "${pkgdir}/usr/lib/cmake/LSL/LSLCMake.cmake" -t "${pkgdir}/opt/LSL/share"
    install -Dm644 "${pkgdir}/usr/lib/cmake/LSL/LSLConfig.cmake" -t "${pkgdir}/opt/LSL/share"
    install -Dm644 "${pkgdir}/usr/lib/cmake/LSL/LSLConfigVersion.cmake" -t "${pkgdir}/opt/LSL/share"
    install -Dm644 "${pkgdir}/usr/lib/cmake/LSL/LSLTargets-none.cmake" -t "${pkgdir}/opt/LSL/share"
    install -Dm644 "${pkgdir}/usr/lib/cmake/LSL/LSLTargets.cmake" -t "${pkgdir}/opt/LSL/share"

    install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/opt/LSL/share/licenses"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/LSL/licenses"
}
