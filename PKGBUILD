pkgdesc="Intel® RealSense™ Cross Platform"
url="https://www.intelrealsense.com/"

pkgname=librealsense2
pkgver='2.54.2'
pkgrel=1
arch=('x86_64')
license=("Apache-2.0")

makedepends=(
    cmake
    git
)

depends=(
    glfw-x11
    glu
    gtk3
    libusb
)

_dir="librealsense-${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/IntelRealSense/librealsense/archive/v${pkgver}.tar.gz"
    "g++13.patch"
    "realsense-viewer.desktop"
)
sha256sums=('e3a767337ff40ae41000049a490ab84bd70b00cbfef65e8cdbadf17fd2e1e5a8'
            'c316ff9d5ecdcf22a363c5f8f0628ccd18d9243b31b6a8d7d4e023eaf29467de'
            '59281f91e7d471a7dde1cf7207eddd8624e05218cc4301ee52e4c453a0c8ab21')
conflicts=('librealsense')

prepare() {
    cd ${srcdir}/${_dir}
    # there is no group called plugdev in archlinux
    sed -i 's|, GROUP:="plugdev"||g' "config/99-realsense-libusb.rules"
    sed -i 's|, GROUP="plugdev"||g' "config/99-realsense-libusb.rules"
    # patch for g++13
    # check if g++13 is installed
    gnu13_installed=$(g++ --version | grep 13)
    if [ -n "${gnu13_installed}" ]; then
        patch -p1 -i ${srcdir}/g++13.patch
    fi
}

build() {
    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    CFLAGS="${CFLAGS} -Wformat -pthread" \
    CXXFLAGS="${CXXFLAGS} -Wformat -pthread" \
    unset HOME
    cmake ${srcdir}/${_dir} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_SBINDIR=bin \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=on \
        -DBUILD_WITH_STATIC_CRT=off \
        -DBUILD_WITH_OPENMP=on \
        -DBUILD_EXAMPLES=true \
        -DBUILD_WITH_TM2=true
    make -j$(nproc)
}

package() {
    cd ${srcdir}/build
    make DESTDIR="${pkgdir}/" install

    # Install documentation
    install -dm755 "${pkgdir}/usr/share"
    mv "${pkgdir}/Documents/librealsense2" "${pkgdir}/usr/share"
    rmdir "${pkgdir}/Documents"

    # Install udev rules
    cd ${srcdir}/${_dir}
    install -Dm644 "config/99-realsense-libusb.rules" "${pkgdir}/usr/lib/udev/rules.d/99-realsense-libusb.rules"
    install -Dm644 "config/99-realsense-d4xx-mipi-dfu.rules" "${pkgdir}/usr/lib/udev/rules.d/99-realsense-d4xx-mipi-dfu.rules"
    install -Dm644 "config/99-realsense-libusb.rules" "${pkgdir}/etc/udev/rules.d/99-realsense-libusb.rules"
    install -Dm644 "config/99-realsense-d4xx-mipi-dfu.rules" "${pkgdir}/etc/udev/rules.d/99-realsense-d4xx-mipi-dfu.rules"

    # Install assets
    cd ${srcdir}/${_dir}
    install -Dm644 common/res/icon_512.png "${pkgdir}/usr/share/pixmaps/realsense-viewer.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}
    install -Dm644 realsense-viewer.desktop "${pkgdir}/usr/share/applications/realsense-viewer.desktop"
}

post_install() {
    # Reload udev rules
    udevadm control --reload-rules && udevadm trigger
}
