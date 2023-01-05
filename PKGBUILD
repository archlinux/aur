# Creator: Peter Petrov <onestone at gmail dot com>
# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
_gitrel=a973c36ed296
_pkgrel=3
pkgname=omnikey_ifdokccid
pkgver=4.3.3
pkgrel=5
pkgdesc="PCSC driver for OMNIKEY 1021, 3x21, 6121,512x, 532x"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.hidglobal.com/"
license=('custom:HID_OK_Drivers_EULA')
depends=('libusb' 'pcsclite')
conflicts=('omnikey_ifdokccid-git')
source=("https://www3.hidglobal.com/sites/default/files/drivers/omnikey_ccid_driver_for_8051_controller_based_readers_v.${pkgver}.zip")
sha256sums=('093c4a6ea3265c812cc6b876c6277aeb662bb60d59dadfd697ff3dc99049775e')

prepare() {
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
    _PACKAGE_NAME="ifdokccid_linux_${_ARCH}-${pkgver}-${_pkgrel}-${_gitrel}"

    # Extract the platform package
    mkdir -p ${pkgname}
    tar xzf ${_PACKAGE_NAME}.tar.gz

    # Move all the package files in a common diretory name
    mv ${_PACKAGE_NAME}/* ${pkgname}

    # Rename the bundle directory
    mv ${pkgname}/${_PACKAGE_NAME}.bundle ${pkgname}/${pkgname}.bundle
}

package() {
    cd ${pkgname}

    # Start to build the driver package
    mkdir -p $pkgdir/usr/lib/pcsc/drivers
    cp -r ${pkgname}.bundle $pkgdir/usr/lib/pcsc/drivers
    mkdir -p $pkgdir/etc
    install -m0600 omnikey.ini $pkgdir/etc/omnikey.ini
    mkdir -p $pkgdir/etc/udev/rules.d
    install -m0644 z98_omnikey.rules $pkgdir/etc/udev/rules.d/z98_omnikey.rules
    mkdir -p $pkgdir/usr/lib/udev
    install -m0744 ok_pcscd_hotplug.sh $pkgdir/usr/lib/udev/ok_pcscd_hotplug.sh
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm644 HID_OK_Drivers_EULA "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
