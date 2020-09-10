#Maintainer: CrankySupertoon <crankysupertoon@gmail.com>

pkgname=go-to-meeting-nativefier
_pkgname=go-to-meeting
__pkgname=GoToMeeting
pkgver=1.0.0
pkgrel=1
pkgdesc="GoToMeeting desktop built with nativefier (electron)"
arch=("x86_64")
license=("custom")
makedepends=("nodejs-nativefier" "gendesk")
source_x86_64=("icon.png::https://raw.githubusercontent.com/CrankySupertoon/Go-To-Meeting-Linux/master/logo.png")
md5sums_x86_64=('SKIP')

build() {
  cd "${srcdir}"  
  nativefier --platform "linux" --app-version "1.00" --build-version "1.00" --background-color "#2e2c29" --disable-context-menu --disable-dev-tools --title-bar-style "hiddenInset" --width "1080px" --height "720px" --icon "icon.png" --fast-quit --internal-urls "gotomeeting.*" 'https://app.gotomeeting.com/'
}

prepare() {
    # Generate .desktop
    gendesk -f --pkgname "${__pkgname}" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${_pkgname}" -n
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${_pkgname}"
    cp -Rr "${srcdir}/GoToMeeting-linux-x64/"* "${pkgdir}/opt/${_pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${__pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${_pkgname}/${__pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${_pkgname}/${__pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
