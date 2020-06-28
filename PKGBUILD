# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="amulet-map-editor-bin"
pkgver="0.6.9.2"
pkgrel=1
arch=('x86_64')
pkgdesc="A new Minecraft world editor and converter that supports all versions since Java 1.12 and Bedrock 1.7."
url="https://www.amulet-editor.com/"
license=('MIT')
makedepends=('gendesk' 'dos2unix' 'wget')

source_x86_64=(
    "Amulet-v${pkgver}-linux.zip::https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/v${pkgver}/Amulet-v${pkgver}-linux.zip"
)

md5sums_x86_64=('SKIP')

prepare() {
    # Generate .desktop
    gendesk -f --pkgname "Amulet Map Editor" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" --terminal "true" -n
    cd ${srcdir}
    mv Amulet\ Map\ Editor.desktop ${pkgname}.desktop

    # make executable
    cd "${srcdir}/Amulet/"
    wget "https://pastebin.com/raw/Ec8QabtF" -O "amuletlaunch.sh" | dos2unix
    dos2unix ./amuletlaunch.sh

}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/Amulet/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/Amulet/amulet_map_editor/img/icon128.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    
    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/amuletlaunch.sh" "${pkgdir}/usr/bin/${pkgname}"

    # make sure the main binary has the right permissions
    cd "${pkgdir}/opt/"
    chmod -R 755 "${pkgname}"

}
