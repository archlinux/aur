# Maintainer: hodasemi <michaelh.95 at t-online dot de>
# Maintainer: wheaney <wayne at xronlinux dot com>
_pkgbase=XRLinuxDriver
pkgname="xr-driver-breezy-gnome-git"
pkgver=0.10.5
pkgrel=1
pkgdesc="XR Linux Driver for Breezy GNOME"
arch=('x86_64' 'aarch64')
url="https://github.com/wheaney/XRLinuxDriver"
license=('GPL-3.0')
install=hooks.install
makedepends=('cmake' 'make')
depends=('openssl' 'libevdev' 'libusb' 'json-c' 'curl' 'hidapi' 'python-yaml')
source=("git+${url}")
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
    install -Dm755 ${_pkgbase}/build/xrDriver "${pkgdir}"/usr/bin/xrDriver
    sed -i '/ExecStart/c\ExecStart=xrDriver' ${_pkgbase}/systemd/xr-driver.service
    sed -i '/WantedBy/c\WantedBy=default.target' ${_pkgbase}/systemd/xr-driver.service
    sed -i '/Environment/d' ${_pkgbase}/systemd/xr-driver.service
    install -Dm644 ${_pkgbase}/systemd/xr-driver.service "${pkgdir}"/usr/lib/systemd/user/xr-driver.service
    install -Dm755 ${_pkgbase}/bin/xr_driver_cli "${pkgdir}"/usr/bin/xr_driver_cli

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

