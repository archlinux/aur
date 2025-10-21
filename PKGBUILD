# Maintainer: hodasemi <michaelh.95 at t-online dot de>
# Maintainer: wheaney <wayne at xronlinux dot com>
_pkgbase=XRLinuxDriver
pkgname="xr-driver-git"
pkgver=2.4.1
pkgrel=2
pkgdesc="XR Linux Driver"
arch=('x86_64' 'aarch64')
url="https://github.com/wheaney/XRLinuxDriver"
license=('GPL-3.0')
install=hooks.install
makedepends=('cmake' 'make')
depends=('openssl' 'libevdev' 'libusb' 'json-c' 'curl' 'hidapi' 'wayland' 'systemd-libs' 'python-yaml')
source=("git+${url}#commit=3bab088768849a3068146586fed60ef0cc7d506d")
md5sums=(SKIP)

prepare() {
  USER=${SUDO_USER:-$USER}
  if [ -n "$USER" ]; then
    USER_HOME=$(getent passwd $USER | cut -d: -f6)
    if [ -e "$USER_HOME/.local/bin/xr_driver_uninstall" ]; then
      echo "Please uninstall XRLinuxDriver using $USER_HOME/.local/bin/xr_driver_uninstall, then reattempt the AUR installation"
      exit 1
    fi
  fi
}

build() {
    cd ${_pkgbase}

    # init submpdules
    git submodule update --init --recursive modules/xrealInterfaceLibrary

    # build xr driver
    mkdir build/
    cd build
    cmake ..
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

    if compgen -G "${_pkgbase}/lib/${CARCH}/*.so" > /dev/null; then
        install -Dm755 ${_pkgbase}/lib/${CARCH}/*.so -t "${pkgdir}"/usr/lib/
    fi

    # udev rules
    install -Dm644 ${_pkgbase}/udev/70-viture-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-viture-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-xreal-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-xreal-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-rayneo-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-rayneo-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-rokid-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-rokid-xr.rules
    install -Dm644 ${_pkgbase}/udev/70-uinput-xr.rules "${pkgdir}"/usr/lib/udev/rules.d/70-uinput-xr.rules

    # make sure uinput module is loaded
    install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
    echo "uinput" > "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
