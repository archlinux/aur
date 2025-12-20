# Maintainer: Nick Haghiri <nshaghiri+aur [at] gmail [dot] com>

pkgname=hexcore-link
pkgver=2.5.9
pkgrel=4
pkgdesc="Hexcore Link for ANNE PRO 2D and other keyboards (firmware > 3.0)"
arch=('x86_64')
url="https://www.hexcore.xyz/hexcore-link"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'libxkbcommon-x11')
options=('!strip' '!emptydirs')

source_x86_64=("https://storage.googleapis.com/aur-resources/HexcoreLink_${pkgver}_x64_LOCAL.tar.gz"
               "deb_extra_files_hexcore.tar.gz")
sha256sums_x86_64=('586616ec0cd3dc373f4854cfd9f5ca04c7fd8c6bc9d61139fe32503b6ca3ed49'
                   '94e4942cc7408feb419e76aa2867e50bdf2bedefd734eb367286b5a7844d2c46')

package() {
    # 1. Create directories
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"

    # 2. Extract files to /opt
    cp -rt "${pkgdir}/opt/${pkgname}" "${srcdir}/HexcoreLink_${pkgver}_x64/"*

    # 3. Install extra files (icons, desktop files)
    if [ -d "${srcdir}/usr" ]; then
        cp -rt "${pkgdir}/usr" "${srcdir}/usr/"*
    fi

    # 4. Fix the Desktop Entry Exec path automatically
    # This replaces the hardcoded /opt path with a standard system-wide command
    sed -i "s|Exec=.*|Exec=${pkgname} %U|" "${pkgdir}/usr/share/applications/hexcore-link.desktop"

    # 5. Fix permissions
    chmod 755 "${pkgdir}/opt/${pkgname}/hexcore-link"

    # 6. Licenses
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"
}
