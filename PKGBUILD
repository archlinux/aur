# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libethercat
pkgname=(libethercat{,-tools})
pkgver=0.7.1
pkgrel=1
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
    git
    pkgconf
)
checkdepends=()
optdepends=()
source=("${pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('76bb4e1c5399d813ad7824efd1c884eb1d8e3911f46e1b8567d570acfa5f617d')
options=()

build() {
    cd "${srcdir}/${pkgbase}/"

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
    cd "${srcdir}/${pkgbase}"
    ctest --test-dir build --output-on-failure
}

package_libethercat() {
    provides=(${pkgname}
        libethercat.so)
    conflicts=(${pkgname}
        libethercat.so)

    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/${pkgbase}/build

    #cd "${srcdir}/${pkgname}/build"
    #make DESTDIR=${pkgdir} install
}

package_libethercat-tools() {
    provides=(${pkgname} eepromtool ethercatdiag example-with-dc foe-tool)
    conflicts=(${pkgname} eepromtool ethercatdiag example-with-dc foe-tool)
    depends+=(libethercat.so)

    cd "${srcdir}/${pkgbase}/build"
    install -Dvm755 -t ${pkgdir}/usr/bin eepromtool
    install -Dvm755 -t ${pkgdir}/usr/bin ethercatdiag
    install -Dvm755 example_with_dc ${pkgdir}/usr/bin/example-with-dc
    install -Dvm755 foe_tool ${pkgdir}/usr/bin/foe-tool
}
