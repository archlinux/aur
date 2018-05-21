# Creator: Peter Petrov <onestone at gmail dot com>
# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
_gitrel=a973c36ed296
pkgname=omnikey_ifdokccid
pkgver=4.3.3
pkgrel=3
pkgdesc="PCSC driver for OMNIKEY 1021, 3x21, 6121,512x, 532x"
arch=('any')
url="http://www.hidglobal.com/"
license=('custom:HID_OK_Drivers_EULA')
depends=('libusb' 'pcsclite')
makedepends=('unzip')
conflicts=('omnikey_ifdokccid-git')
source=("https://www.hidglobal.fr/sites/default/files/drivers/omnikey_ccid_driver_for_8051_controller_based_readers_v.${pkgver}.zip")
md5sums=('441670be336df12167652a751ba5a08e')

package() {
    _ARCH=""

    # Update the architecture name based on the current one running this PKGBUILD
    if [ "$CARCH" == "i686" ]; then
        _ARCH="i686"
    elif [ "$CARCH" == "x86_64" ]; then
        _ARCH="x86_64"
    else
        _ARCH="arm"
    fi

    cd $srcdir/

    # Temporary variable
    _PACKAGE_NAME="ifdokccid_linux_${_ARCH}-${pkgver}-${pkgrel}-${_gitrel}"

    # Extract the platform package
    tar xzf ${_PACKAGE_NAME}.tar.gz
    cd ${_PACKAGE_NAME}

    # Start to build the driver package
    mkdir -p $pkgdir/usr/lib/pcsc/drivers
    cp -r ${_PACKAGE_NAME}.bundle $pkgdir/usr/lib/pcsc/drivers
    mkdir -p $pkgdir/etc
    install -m0600 omnikey.ini $pkgdir/etc/omnikey.ini
    mkdir -p $pkgdir/etc/udev/rules.d
    install -m0644 z98_omnikey.rules $pkgdir/etc/udev/rules.d/z98_omnikey.rules
    mkdir -p $pkgdir/usr/lib/udev
    install -m0744 ok_pcscd_hotplug.sh $pkgdir/usr/lib/udev/ok_pcscd_hotplug.sh
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm644 HID_OK_Drivers_EULA "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
