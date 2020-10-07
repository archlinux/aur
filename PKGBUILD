#Maintainer: CrankySupertoon <crankysupertoon@gmail.com>

pkgname=google-meet-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc="Google Meets desktop built with electron"
arch=("x86_64")
license=("custom")
makedepends=("gendesk")
depends=("electron" "yarn" "npm")
source_x86_64=("icon.png::https://www.gstatic.com/images/branding/product/2x/meet_64dp.png"
	       "https://github.com/arjun-g/google-meet-desktop/archive/v1.2.0.tar.gz")
md5sums_x86_64=('SKIP' 'SKIP')
conflicts=('google-meet-nativefier')

build() {
  cd "${srcdir}/google-meet-desktop-${pkgver}"
  yarn
  npx electron-builder --linux dir
}

prepare() {
    # Generate .desktop
    gendesk --pkgname "Google Meets" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Google Meets.desktop" "${pkgname}.desktop"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

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
