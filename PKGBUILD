pkgname=phd2-git
pkgver=2.6.13dev7.52.g59c76e38
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
source=("git+https://github.com/OpenPHDGuiding/phd2.git")
sha256sums=('SKIP')

pkgver() {
    cd phd2
    echo "$(git describe --tags --long | sed 's/^v//;s/-/./g')"
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
        ../phd2

    make -j$(nproc)
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/include"
}
