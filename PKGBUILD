pkgname="mcreator"
pkgver="2020.4"
pkgrel=1
arch=('x86_64')
pkgdesc="MCreator is a software used to make Minecraft mods and data packs using intuitive easy-to-learn interface or with an integrated code editor. It is used worldwide by Minecraft players, aspiring mod developers, for education and by STEM workshops."
url="https://mcreator.net"
license=('ARR')
makedepends=('gendesk' 'dos2unix' 'wget')

source_x86_64=(
	"MCreator.tar.gz::https://mcreator.net/repository/2020-4/MCreator%202020.4%20Linux%2064bit.tar.gz"
)

md5sums_x86_64=('SKIP')

prepare() {
    # extract binary
    tar -xzvf MCreator.tar.gz

    # make desktop
    cd "${srcdir}"
    gendesk -f --pkgname "MCreator" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n
    mv "MCreator.desktop" "${pkgname}.desktop"

    # make executable
    cd ${srcdir}/MCreator20204
    wget "https://pastebin.com/raw/EhmVNZLX" -O "mcreatorlaunch.sh" | dos2unix
    dos2unix ./mcreatorlaunch.sh
}

package() {
    # install the main files.
    cd ${srcdir}/MCreator20204
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/MCreator20203/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cd ${srcdir}/MCreator20204
    mv "icon.png" "${pkgname}.png"
    cp -Rr "${srcdir}/MCreator20203/${pkgname}.png" "${pkgdir}/usr/share/icons"
	
    # file perms
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;	

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}launch.sh"
    cd "${pkgdir}/opt/${pkgname}/jdk/bin"
    chmod +x java

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}launch.sh" "${pkgdir}/usr/bin/${pkgname}"
}
