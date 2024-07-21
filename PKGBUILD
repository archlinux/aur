# Maintainer: hodasemi <michaelh.95 at t-online dot de>
# Maintainer: wheaney <wayne at xronlinux dot com>
_pkgbase=XRLinuxDriver
pkgname="xr-driver-breezy-gnome-git"
pkgver=0.10.2
pkgrel=3
pkgdesc="XR Linux Driver for Breezy GNOME"
arch=('x86_64' 'aarch64')
url="https://github.com/wheaney/XRLinuxDriver"
license=('GPL-3.0')
install=hooks.install
makedepends=('cmake' 'make')
depends=('openssl' 'libevdev' 'libusb' 'json-c' 'curl' 'hidapi')
source=("git+${url}#commit=21452bcf6a073888186448e247ed8ddca85946aa")
md5sums=(SKIP)

build() {
    cd ${_pkgbase}

    # init submpdules
    git submodule update --init --recursive modules/xrealInterfaceLibrary

    # build xr driver
    mkdir build/
    cd build
    BREEZY_DESKTOP=1 cmake -DSYSTEM_INSTALL=1 ..
    make
}

package() {
    # copy xr driver
    install -Dm755 ${_pkgbase}/build/xrealAirLinuxDriver "${pkgdir}"/usr/bin/xrealAirLinuxDriver
    sed -i '/ExecStart/c\ExecStart=xrealAirLinuxDriver' ${_pkgbase}/systemd/xreal-air-driver.service
    sed -i '/WantedBy/c\WantedBy=default.target' ${_pkgbase}/systemd/xreal-air-driver.service
    sed -i '/Environment/d' ${_pkgbase}/systemd/xreal-air-driver.service
    install -Dm644 ${_pkgbase}/systemd/xreal-air-driver.service "${pkgdir}"/usr/lib/systemd/user/xreal-air-driver.service
    install -Dm755 ${_pkgbase}/bin/xreal_driver_config "${pkgdir}"/usr/bin/xreal_driver_config

    install -Dm755 ${_pkgbase}/lib/${CARCH}/libRayNeoXRMiniSDK.so "${pkgdir}"/usr/lib/libRayNeoXRMiniSDK.so

    # udev rules
    install -Dm644 ${_pkgbase}/udev/70-viture-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-viture-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-xreal-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-xreal-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-rayneo-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-rayneo-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-uinput-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-uinput-xr.rules

    # make sure uinput module is loaded
    install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
    echo "uinput" > "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

