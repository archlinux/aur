# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='parallels-client'
pkgver='19.2.23906'
# has an extra digit in the middle for some reason
_downloadver='19.2.0.23906'
pkgrel=1
pkgdesc="A remote work tool (rasclient, 2x RDP client, Parallels RAS)"
arch=('x86_64')
url="https://www.parallels.com/products/ras/capabilities/parallels-client/"
license=("custom:${pkgname}")
# from .deb control file
depends=('libxcursor' 'zlib' 'fontconfig' 'libxrender'
         'glibc' 'libxrandr' 'libsm' 'libxtst' 'libice'
         'libxext' 'libxi' 'gcc' 'alsa-lib' 'alsa-plugins'
         'libxinerama' 'libxft' 'libx11' 'pcsclite'
         'libcups' 'libxpm' 'libxml2' 'libmtp' 'libusb'
         'nas'
         'udisks2'
         'qt5-base' 'qt5-x11extras')
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("https://download.parallels.com/ras/v${pkgver%%.*}/${_downloadver}/RASClient-${pkgver}_x86_64.deb")
noextract=()
sha256sums=('b5d690ced7784ebe8b44304a82469dca08c47d25cac46aa456ed4a3ff81d8842')


package() {
    bsdtar --cd "${pkgdir}" -xf "${srcdir}/data.tar.xz"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Fix udev symlink in /lib
    install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
    mv "${pkgdir}/lib/udev/rules.d/90-rasusb.rules" "${pkgdir}/usr/lib/udev/rules.d/"
    rm -rf "${pkgdir}/lib/"

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/2xclient/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/usr/share/doc"
}
