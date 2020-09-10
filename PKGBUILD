#Maintainer: CrankySupertoon <crankysupertoon@gmail.com>

pkgname=go-to-meeting-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Go To Meeting desktop built with electron"
arch=("x86_64")
license=("custom")
makedepends=("electron" "gendesk")
source_x86_64=("https://raw.githubusercontent.com/CrankySupertoon/gotomeeting-nativefier/master/icon.png"
	       "https://github.com/CrankySupertoon/gotomeeting-linux-desktop/archive/${pkgver}.tar.gz")
md5sums_x86_64=('SKIP' 'SKIP')

build() {
  cd "${srcdir}/gotomeeting-linux-desktop-${pkgver}"
  yarn
  npx electron-builder --linux dir
}

prepare() {
    # Generate .desktop
    gendesk --pkgname "GoToMeeting" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/gotomeeting-linux-desktop-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/GoToMeeting.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
