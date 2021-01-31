pkgname="mcreator"
_pkgname="MCreator"
pkgver="2020.5"
_pkgver="20205"
pkgrel=4
arch=('x86_64')
pkgdesc="MCreator is a software used to make Minecraft mods and data packs using intuitive easy-to-learn interface or with an integrated code editor. It is used worldwide by Minecraft players, aspiring mod developers, for education and by STEM workshops."
url="https://mcreator.net"
license=('ARR')
makedepends=('gendesk')
depends=('jdk8-openjdk')
source_x86_64=(
	"MCreator-${_pkgver}.tar.gz::https://mcreator.net/repository/2020-5/MCreator%202020.5%20Linux%2064bit.tar.gz"
	"mcreatorlaunch.sh"
)

md5sums_x86_64=('SKIP' 'SKIP')

prepare() {
    # Make Desktop File
    gendesk --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
}

package() {
    # Remove Bundled Java
    cd "${srcdir}/${_pkgname}${_pkgver}/jdk"

    # Install The Main Files.
    cd ${srcdir}/${_pkgname}${_pkgver}
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/${_pkgname}${_pkgver}/"* "${pkgdir}/opt/${pkgname}"

    # Install Launcher
    cp "${srcdir}/${pkgname}launch.sh" "${pkgdir}/opt/${pkgname}/${pkgname}launch.sh"

    # Desktop Entry
    install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install The Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cd ${srcdir}/${_pkgname}${_pkgver}
    mv "icon.png" "${pkgname}.png"
    cp -Rr "${srcdir}/${_pkgname}${_pkgver}/${pkgname}.png" "${pkgdir}/usr/share/icons"

    # File Perms
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # Make Sure The Main Binary Has The Right Permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}launch.sh"
    cd "${pkgdir}/opt/${pkgname}/jdk/bin"
    chmod +x java

    # Link The Binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}launch.sh" "${pkgdir}/usr/bin/${pkgname}"
}
