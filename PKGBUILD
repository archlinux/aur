# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=motrix-appimage
pkgver=1.8.14
pkgrel=1
pkgdesc="A full-featured download manager"
arch=("x86_64")
url="https://motrix.app"
license=("MIT")
_pkgname="Motrix-${pkgver}.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("motrix")
conflicts=("motrix")
depends=('fuse2')
source=("${_pkgname}::https://dl.moapp.me/https://github.com/agalwood/Motrix/releases/download/v${pkgver}/${_pkgname}")

sha512sums=("18d8b036a5111704888525b46bd9f4bd5fe2a432fc35e23c7c04909fef49b02226367cb24d1766f8cb9e545a61d852fb6ee9ecd1a7e17a487c81e8e18f74e67d")

_installdir=/opt/appimages

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun --no-sandbox+env DESKTOPINTEGRATION=no ${_installdir}/motrix.AppImage+" "squashfs-root/motrix.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/motrix.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/motrix.AppImage"
    install -Dm644 "squashfs-root/motrix.desktop" "${pkgdir}/usr/share/applications/motrix.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
