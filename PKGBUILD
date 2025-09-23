# Maintainer: 2-4601 <AUR@othermemory.org>
pkgname=atostekid
pkgver=4.4.0.0
pkgrel=1
pkgdesc="New desktop application for Finnish electronic ID cards"
arch=("x86_64")
url="https://dvv.fi/en/linux-versions"
license=("LicenseRef-Atostek")
depends=(
    "botan2"
    "ccid"
    "libqpdf29"
    "minizip"
    "nss"
    "pcsclite"
    "qt6-base"
)
optdepends=(
    "gnome-shell-extension-appindicator: System tray indicator extension for GNOME desktop"
    "libappindicator-gtk3: System tray support for desktop environments"
    "qt6-wayland: Wayland support"
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::https://files.fineid.fi/download/atostek/${pkgver}/linux/AtostekID_DEB_${pkgver}.deb"
    "atostek-id.module"
    "com.atostek.atostekid.desktop"
    "com.atostek.atostekid.png"
)
sha256sums=('6dd0204f2af63963ae5cbaec9ecc85fc43cf430ace4de194e1055d071d43b326'
            '42cf9a65e4913b42ea9b63ebe171050589bdf00d7a48df26d793b394c39efefa'
            'f43a15ecf14e2ae8b71df506738aa6a122270e46d52c7b66c1b239b669d4c7b0'
            'fdfad6cf56013d55d5e7516a093494091fcb9c8a27409d488e780dd2ebebe895')

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    # These libraries are not needed because they can be satisfied with system and AUR packages
    rm -rf "${pkgdir}/usr/lib/atostekid"
    # Install Atostek ID's PKCS #11 module configuration file
    install -D -m 644 atostek-id.module -t "${pkgdir}/usr/share/p11-kit/modules/"
    # Install Atostek ID's PKCS #11 module to the proper location
    install -D -m 644 "${pkgdir}/usr/lib/Atostek-ID-PKCS11.so" -t "${pkgdir}/usr/lib/pkcs11/"
    rm "${pkgdir}/usr/lib/Atostek-ID-PKCS11.so"
    # Handle license and documentation files
    install -D -m 644 "${pkgdir}/usr/share/doc/atostekid/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m 644 "${pkgdir}"/usr/share/doc/atostekid/license_{en,fi,sv}.rtf -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm "${pkgdir}"/usr/share/doc/atostekid/{*.Debian,copyright,license_{en,fi,sv}.rtf}
    # Install desktop and icon files
    install -D -m 644 com.atostek.atostekid.desktop -t "${pkgdir}/usr/share/applications/"
    install -D -m 644 com.atostek.atostekid.png -t "${pkgdir}/usr/share/pixmaps/"
}
