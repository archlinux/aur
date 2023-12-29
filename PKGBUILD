# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

_pkgname='hiddify-next'

# Maintainer: Meow King <mr.meowking@anche.no>
pkgname="hiddify-next-appimage"
pkgver="0.12.3"
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s an open-source, secure and ad-free. "
arch=('any')
# Appimage should contains exclude "strip" option
options=(!strip)
url="https://github.com/hiddify/hiddify-next"
license=('custom:CC-BY-NC-SA-4.0')
conflicts=('hiddify-next')
source=("https://github.com/hiddify/hiddify-next/releases/download/v${pkgver}/hiddify-linux-x64.zip"
        "hiddify-next-appimage.desktop"
        "LICENSE.md")
sha256sums=('7a9c0864c78680827215bc38da8ba9688db015abd8d33ab963535a13b73bafbd'
            '480389ec46cb38845fda0430c8bd4732732722b1ec62681f608b240ede1e0aea'
            'f609d73370ca62925ba8c796afeeb7fb42f4a1569124f84cb25b7026c026d78a')

prepare() {
    sed -i "s/VERSION_PLACEHOLDER/${pkgver}/" hiddify-next-appimage.desktop
    mv ./hiddify-linux-x64.AppImage "./${_pkgname}.AppImage"
    ./"${_pkgname}".AppImage --appimage-extract
}

package() {
    # License
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    # Appimage
    install -Dm755 "${srcdir}/${_pkgname}.AppImage" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
    
    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    
    # logo
    mkdir -p ${pkgdir}/usr/share/icons/
    chmod 755 ${pkgdir}/usr/share/icons
    cp -r "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
    
    # desktop file
    install -Dm644 "${srcdir}/hiddify-next-appimage.desktop" -t "${pkgdir}/usr/share/applications/hiddify-next-appimage.desktop"
}
