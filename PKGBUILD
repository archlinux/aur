# Maintainer: Nick Haghiri <nshaghiri+aur [at] gmail [dot] com>

pkgname=hexcore-link
pkgver=2.5.9
pkgrel=7
pkgdesc="Hexcore Link for ANNE PRO 2D and other keyboards (firmware > 3.0)"
arch=('x86_64')
url="https://www.hexcore.xyz/hexcore-link"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'libxkbcommon-x11')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://pub-0ff293aefb644607ac910219d9762b50.r2.dev/HexcoreLink_${pkgver}_x64.tar.gz"
               "deb_extra_files_hexcore.tar.gz"
               "70-hexcore-link.rules")
sha256sums_x86_64=('726f2062d2446d2101e6b2eec5e95d186c1a0a15e21ede69e5ff573ec30d24e9'
                   '94e4942cc7408feb419e76aa2867e50bdf2bedefd734eb367286b5a7844d2c46'
                   '2aaca45668bc444b166f4aa3639df24c4dbbe843486221172010062abd9a0b0c')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"

    cp -rt "${pkgdir}/opt/${pkgname}" "${srcdir}/HexcoreLink_${pkgver}_x64/"*

    if [ -d "${srcdir}/usr" ]; then
        install -d "${pkgdir}/usr"
        cp -rt "${pkgdir}/usr" "${srcdir}/usr/"*
    fi

    # Fix: Reverting Exec path to the absolute path in /opt
    sed -i "s|Exec=.*|Exec=/opt/${pkgname}/${pkgname} %U|" "${pkgdir}/usr/share/applications/hexcore-link.desktop"

    # Create symlink for terminal use
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install the new Udev Rules for keyboard detection
    install -Dm644 "${srcdir}/70-hexcore-link.rules" "${pkgdir}/usr/lib/udev/rules.d/70-${pkgname}.rules"

    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"

    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"
}
