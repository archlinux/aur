pkgname=phd2-git
pkgver=2.6.13dev7
pkgrel=1
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64' 'aarch64')
license=('BSD3')
depends=(
    'wxwidgets-gtk3'
    'cfitsio'
    'opencv'
    'libusb'
    'systemd'
    'v4l-utils'
    'libnova'
    'curl'
    'libindi'
    'eigen'
    'qt6-base'
    'hdf5'
    'vtk'
    'jsoncpp'
    'glew'
    'fmt'
    'zlib'
)
makedepends=('git' 'cmake' 'gtest' 'eigen')
source=(
    "https://github.com/OpenPHDGuiding/phd2/archive/refs/tags/v${pkgver}.tar.gz"
    "0001-gp_guider_test.cpp-add-include-iomanip-for-std-setw.patch"
    "0002-gaussian_process.cpp-add-include-cassert-for-assert.patch"
)
sha256sums=('c7916966e16c307544acc10a82ccafd0cd54757d019e42b8d1a12c3e1096d53d'
            'd465c3aa0c3be079e802e79883c04bd31f69ff12e5805d76df91fc64435ea32d'
            'ba647dbc28d23109e5a3b301d34b751c229eabd2daedcc9d257cf7ee3538087d')

prepare() {
    cd "phd2-${pkgver}"

    for p in ../*.patch; do
        patch -p1 < "$p"
    done
}

build() {
    mkdir -p build
    cd build

    cmake \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DUSE_SYSTEM_LIBINDI=ON \
        -DUSE_SYSTEM_LIBUSB=ON \
        -DUSE_SYSTEM_GTEST=ON \
        -DEIGEN_SRC=/usr/include/eigen3 \
        -DOPENSOURCE_ONLY=1 \
        ../phd2-${pkgver}

    make -j$(nproc)
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/include"
}
