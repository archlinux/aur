# Maintainer: S Stewart <tda@null.net>
# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
# Special thanks to RyanTheAllmighty for making hyper-appimage
pkgname="gdlauncher-bin"
_pkgname="gdlauncher"
pkgver="1.1.11"
pkgrel=2
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdevs.io"
license=('GPL3')
makedepends=('gendesk' 'imagemagick')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
provides=('gdlauncher')
conflicts=('gdlauncher' 'gdlauncher-appimage' 'gdlauncher-git' 'gdlauncher-classic')
source_x86_64=("GDLauncher-${pkgver}.zip::https://github.com/gorilla-devs/GDLauncher/releases/download/v${pkgver}/GDLauncher-linux-setup.zip"
               "https://github.com/gorilla-devs/GDLauncher/raw/master/public/icon.png")
md5sums_x86_64=('ed412a53faf3679af0d081eef0b8637d'
                'af0ce1364e34f49af3793bf8193c5369')
icon_sizes=(48 128 256 1024)

prepare() {
    # Generate .desktop
    gendesk --pkgname "GDLauncher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "GDLauncher.desktop" "${pkgname}.desktop"

    # Resize icons
    for size in "${icon_sizes[@]}"; do
        convert "icon.png" -size "${size}x${size}" "icon_${size}x${size}.png"
    done
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname}/"
    rm "${pkgdir}/opt/${pkgname}/"{icon*.png,GDLauncher-${pkgver}.zip}  # remove symlinked source files

    # desktop entry
    install -d -m755 "${pkgdir}/usr/share/applications/"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icons
    for size in "${icon_sizes[@]}"; do
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/"
        install -D -m644 "${srcdir}/icon_${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin/"
    ln -sr "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
