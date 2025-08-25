# Maintainer: João Freitas <joaj.freitas at gmail dot com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler
pkgver='3.10.11'
pkgrel=3
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

_dir="PlotJuggler-${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
    "plotjuggler3.10.9-1.patch"
    "plotjuggler3.10.9-2.patch"
)

prepare() {
    patch -d PlotJuggler-$pkgver -Np1 -i "$srcdir/plotjuggler3.10.9-1.patch"
    patch -d PlotJuggler-$pkgver -Np1 -i "$srcdir/plotjuggler3.10.9-2.patch"
}

build() {
    cd "PlotJuggler-${pkgver}"
    cmake -S . -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build
}

package() {
    cd ${srcdir}/build
	make DESTDIR=${pkgdir} install

    # clean up system-conflict files
    rm -f ${pkgdir}/usr/local/lib/libfastcdr.a
    rm -rf ${pkgdir}/usr/local/lib/cmake/fastcdr/
}

sha256sums=('9492e6b5f676a237616db056d1d45cae64d9a880690e8dd6b93784dd205b93bb'
            'f20a39a311c02973009aabebfd2934afd8db7819ab1be8157039496c88baebcb'
            '1b0b3c7f774f5736e17b180ccdeb9f5468184e337848ae12efeb7b1b90fcad29')
