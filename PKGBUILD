# Maintainer: Nick Haghiri <nshaghiri+aur [at] gmail [dot] com>
pkgname=obinskit
pkgver=1.2.11
pkgrel=5
pkgdesc="ObinsKit for Anne Pro and Anne Pro 2"
arch=('x86_64')
url="https://www.hexcore.xyz/obinskit"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'libxkbcommon-x11')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://storage.googleapis.com/aur-resources/ObinsKit_${pkgver}_x64.tar.gz"
               "deb_extra_files_obins.tar.gz"
				"70-obinskit.rules")
sha256sums_x86_64=('2a10aed5366c2667174525924da60e323b7e200e2aa9abc1c1a6335e792096cd'
                   '137296d606b8127dfda7626421fd17fbee06712678b7ae25793e51d78221fab5'
                   '34619caa538ac790d22139c2a870b050630c8d9b68ac5b7d210d7dcd0c4d838b')

package() {
    # 1. Install main files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -rt "${pkgdir}/opt/${pkgname}" "${srcdir}/ObinsKit_${pkgver}_x64/"*

    # 2. Install extra files (icons/desktop)
    if [ -d "${srcdir}/usr" ]; then
        # Ensure the target directory exists first
        install -d "${pkgdir}/usr" 
        cp -rt "${pkgdir}/usr" "${srcdir}/usr/"*
    fi

    # 3. Create the symlink (tracked by pacman)
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # 4. Create Udev Rules (tracked by pacman)
	install -Dm644 "${srcdir}/70-obinskit.rules" "${pkgdir}/usr/lib/udev/rules.d/70-${pkgname}.rules"

    # 5. Licenses
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"
}
