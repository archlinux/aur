# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libethercat
pkgname=(libethercat{,-tools})
pkgver=0.6.3
pkgrel=0
pkgdesc="EtherCAT master library. This library is used to build a deterministic fieldbus network with EtherCAT components."
arch=($CARCH)
url="https://github.com/robert-burger/libethercat"
license=('LGPL-3.0-only')
groups=()
replaces=()
depends=(
    glibc
    libosal)
makedepends=(
    cmake
    pkgconf)
checkdepends=()
optdepends=()
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e67c219e4f8c8a8974331f421b79b080a8ca8c306b967c368c01dcf9c0205d6c')
options=()

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    # gcc build
    #     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DECAT_DEVICE="sock_raw+sock_raw_mmaped" \
        -Wno-dev \
        -B build

    cmake --build build
}

check() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    ctest --test-dir build --output-on-failure

}

package_libethercat() {
    provides=(${pkgname}
        libethercat.so)
    conflicts=(${pkgname}
        libethercat.so)

    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/${pkgbase}-${pkgver}/build

    #     cd "${srcdir}/${pkgname}-${pkgver}/build"
    #     make DESTDIR=${pkgdir} install
}

package_libethercat-tools() {
    provides=(${pkgname} eepromtool ethercatdiag example-with-dc)
    conflicts=(${pkgname} eepromtool ethercatdiag example-with-dc)
    depends+=(libethercat.so)

    cd "${srcdir}/${pkgbase}-${pkgver}/build"
    install -Dvm755 -t ${pkgdir}/usr/bin eepromtool
    install -Dvm755 -t ${pkgdir}/usr/bin ethercatdiag
    install -Dvm755 example_with_dc ${pkgdir}/usr/bin/example-with-dc
}
