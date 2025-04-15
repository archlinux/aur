# Maintainer: 2-4601 <AUR@othermemory.org>
pkgname=atostekid
pkgver=4.3.0.0
pkgrel=3
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
    "${pkgname}-${pkgver}.deb::https://dvv.fi/documents/16079645/237937167/AtostekID_DEB_${pkgver//_/-}.deb"
    "atostek-id.module"
)
sha256sums=(
    "fc753b03e171b39e28bd9f85a43d0986409dbad6d72801cd1d63762a6f444f73"
    "42cf9a65e4913b42ea9b63ebe171050589bdf00d7a48df26d793b394c39efefa"
)

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    rm -rf "${pkgdir}/usr/lib/atostekid"
    mkdir -m 755 -p "${pkgdir}/usr/share/p11-kit/modules/"
    install -m 644 atostek-id.module "${pkgdir}/usr/share/p11-kit/modules/"
    mkdir -m 755 -p "${pkgdir}/usr/lib/pkcs11/"
    install -D -m 755 "${pkgdir}/usr/lib/Atostek-ID-PKCS11.so" "${pkgdir}/usr/lib/pkcs11/"
    rm "${pkgdir}/usr/lib/Atostek-ID-PKCS11.so"
    install -D -m 644 "${pkgdir}/usr/share/doc/atostekid/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    install -m 644 "${pkgdir}"/usr/share/doc/atostekid/license_{en,fi,sv}.rtf "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm "${pkgdir}"/usr/share/doc/atostekid/{*.Debian,copyright,license_{en,fi,sv}.rtf}
}
