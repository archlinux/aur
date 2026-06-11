# Maintainer: czyt <czytcn@gmail.com>
pkgname=virtualhere-client-bin
pkgver=5.9.9
pkgrel=1
pkgdesc="VirtualHere USB Client - share USB devices over the network"
arch=('x86_64' 'aarch64')
url="https://www.virtualhere.com/usb_server_software"
license=('BSD')
install="${pkgname}.install"
optdepends=('avahi: for mDNS/Bonjour discovery')
provides=('virtualhereclient' 'virtualhere-client')
conflicts=('virtualhereclient' 'virtualhere-client')
source_x86_64=("vhclient-${pkgver}-amd64::https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64")
source_aarch64=("vhclient-${pkgver}-arm64::https://www.virtualhere.com/sites/default/files/usbclient/vhuitarm64")
source=("virtualhereclient.service::https://www.virtualhere.com/sites/default/files/usbclient/scripts/virtualhereclient.service")
sha256sums=('dd944c84eedac4587f3ee3f37542391a59c17f9be71f5f523edb48170f312935')
sha256sums_x86_64=('fd132c8e400900996033cbd9c70276a4291985eb40ca687c7c33ca57e0b5e624')
sha256sums_aarch64=('e8e37e479dd1bf22ab6b7df3662c54d13f8a8ce23c3250b09a4fa75344dac6a6')

pkgver() {
    chmod +x "${srcdir}/vhclient-${pkgver}-amd64"
    "${srcdir}/vhclient-${pkgver}-amd64" --help 2>&1 | head -n 1 | sed 's/.[^0-9]*\([0-9]\+[\.0-9]*\),.*/\1/'
}

package() {
    # Install binary to /usr/sbin as per official documentation
    case "$CARCH" in
        x86_64)  _src="vhclient-${pkgver}-amd64" ;;
        aarch64) _src="vhclient-${pkgver}-arm64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/sbin/vhclientx86_64"

    # Install systemd service file
    install -Dm644 "${srcdir}/virtualhereclient.service" "${pkgdir}/etc/systemd/system/virtualhereclient.service"
}
