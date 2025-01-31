# Maintainer: Faisal Moledina (faisal at moledina dot me)
# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=frame

pkgname="${_pkgname}"-eth-dev-appimage
pkgver=0.6.10
pkgrel=1
pkgdesc="A privacy focused Ethereum wallet"
arch=('x86_64')
url="https://frame.sh/"
license=('GPL3')
depends=('fuse2')
provides=("${_pkgname}-eth")
conflicts=("${_pkgname}-eth" "${_pkgname}-eth-dev")
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/floating/frame/releases/download/v${pkgver}/Frame-${pkgver}.AppImage")
noextract=("${_appimage}")
sha512sums_x86_64=('694914fed6f5c5d4d8e0fd3e6ca6a75be6b29b3f6e1ad5e066b84f4c9623c54d3318639967b4e4de6c251286062ed2c107e3f3ea158695f08177e21f20eb4f92')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
