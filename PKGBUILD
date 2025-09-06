# Maintainer: João Freitas <joaj.freitas at gmail dot com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler
pkgver='3.11.0'
pkgrel=1
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
depends=(
    'arrow'
    'binutils'
    'fmt'
    'lua'
    'lz4'
    'mosquitto'
    'nlohmann-json'
    'protobuf'
    'qt5-base'
    'qt5-multimedia'
    'qt5-svg'
    'qt5-websockets'
    'qt5-x11extras'
    'zeromq'
    'zstd'
    # 'fastcdr'     (only in AUR)
    # 'data_tamer'  (not found)
    # 'kissfft-git' (only in AUR)
    # 'libdwarf'    (not sufficient)
    # 'mcap_vendor' (not found)
    # 'qtav'        (only in AUR, deprecated)
    # 'zcm'         (not found)
)

makedepends=(
    'cmake'
    'clang'
)

source=(
    "${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
    "plotjuggler3.11.0-1.patch"
)

prepare() {
    patch -d PlotJuggler-$pkgver -Np1 -i "$srcdir/plotjuggler3.11.0-1.patch"
}

build() {
    cd "PlotJuggler-${pkgver}"
    PJ_PLUGIN_INSTALL_DIRECTORY=/usr/lib; cmake -S . -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build
}

package() {
    cd "PlotJuggler-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    # fastcdr should not be installed,
    # but CPM installs dependencies automatically
    rm -rf "${pkgdir}/usr/include/fastcdr"
    rm -rf "${pkgdir}/usr/lib/cmake/fastcdr"
    rm -f "${pkgdir}/usr/lib/libfastcdr.a"
    rm -rf "${pkgdir}/usr/share/fastcdr"
    rm ${pkgdir}/usr/include/zdict.h
    rm ${pkgdir}/usr/include/zstd.h
    rm ${pkgdir}/usr/include/zstd_errors.h
    rm -r ${pkgdir}/usr/lib/cmake/zstd
    rm ${pkgdir}/usr/lib/pkgconfig/libzstd.pc
}

sha256sums=('87e2c683c4da93ea21fc28890a07e7139384db09fdc14264e95ca361937ab3a7'
            '0a187d228596c14e2434c2b5da2e3cbc4c717be38a8567a305f1ecfa493c9bfb')
