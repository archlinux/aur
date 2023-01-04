# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=labrecorder
pkgver=1.16.3
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Default LSL (LabStreamingLayer) recording program (stable release). It allows to record all streams on the lab network (or a subset) into a single file, with time synchronization between streams.'
arch=('any')
url='https://github.com/sccn/liblsl/'
license=('MIT')
depends=('liblsl')
makedepends=('boost-libs' 'cmake' 'qt5-base')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}::git+https://github.com/labstreaminglayer/App-LabRecorder.git#tag=${_pkgver}")
md5sums=('SKIP')

build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLSL_DIR:STRING='/opt/LSL' \
        -DLSL_UNIXFOLDERS:BOOL='ON' \
        -Wno-dev
    make -C "${pkgname}-${pkgver}/build" all
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install

    mkdir -p "${pkgdir}/opt/LSL/bin"

    ln -rs "${pkgdir}/usr/bin/LabRecorder" -t "${pkgdir}/opt/LSL/bin"
    ln -rs "${pkgdir}/usr/bin/LabRecorder.cfg" -t "${pkgdir}/opt/LSL/bin"
    ln -rs "${pkgdir}/usr/bin/LabRecorderCLI" -t "${pkgdir}/opt/LSL/bin"

    install -Dm644 "${pkgdir}/usr/bin/LICENSE" -t "${pkgdir}/opt/LSL/bin"
}
