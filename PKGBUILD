# Maintainer: Nayla Hanegan <naylahanegan@gmail.com>

pkgname=google-meet-nativefier
_pkgname=google-meet
pkgver=1.0.0
pkgrel=2
pkgdesc="Google Meet desktop built with nativefier (electron)"
arch=("x86_64")
license=("custom")
makedepends=("nodejs-nativefier" "gendesk")
source=("icon.png::https://lh3.googleusercontent.com/n3Eac1gPc5OTEh7Go1jemICnooceXtfs4VZW-4CPukCUi_doFsN9Q8njidksZ4KIFyPJVYtR7ZhLL16VoUJSPE1j74iTXT2xwCqq")
md5sums=('SKIP')
conflicts=('google-meet-desktop')

build() {
  cd "${srcdir}"
  nativefier --name "Meet" --platform "linux" --app-version "1.00" --build-version "1.00" --background-color "#2e2c29" --disable-context-menu --disable-dev-tools --title-bar-style "hiddenInset" --width "1080px" --height "720px" --honest --icon "icon.png" --fast-quit --internal-urls "google.*" 'https://meet.google.com/'
}

prepare() {
    # Generate .desktop
    gendesk --pkgname "Google Meet" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${_pkgname}" -n -f
    mv "Google Meet.desktop" "${pkgname}.desktop"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/Meet-linux-x64/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/Meet"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/Meet" "${pkgdir}/usr/bin/${_pkgname}"
}
