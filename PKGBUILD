# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=parallels-client
pkgver=19.1.23473
_downloadver=19.1.1.23473
_topver=19
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
source=("https://download.parallels.com/ras/v${_topver}/${_downloadver}/RASClient-${pkgver}_x86_64.deb")
noextract=()
sha256sums=('0196cbc91d617e38b76f22aa6980d99e4d929068a1310d4f88de42b085cfecb0')


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
