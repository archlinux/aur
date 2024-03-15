# Maintainer: Aryan Ghasemi <t.me/gnuphile>
pkgname="hiddify-next-appimage"
pkgver="0.17.12"
_pkgname='hiddify'
_archive="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s open-source, secure and ad-free. "
arch=('any')
# Appimage should contains exclude "strip" option
options=(!strip)
url="https://github.com/hiddify/hiddify-next"
license=('custom:CC-BY-NC-SA-4.0')
conflicts=('hiddify-next-bin' 'hiddify-next-git')
noextract=( "${_archive}.AppImage" )
source=(
        "${_archive}.AppImage::https://github.com/hiddify/hiddify-next/releases/download/v${pkgver}/Hiddify-Linux-x64.AppImage"
        "hiddify.desktop"
        "LICENSE.md")
sha256sums=('d5253f23c1ca02be075160bd985c19a96d4581fb711c65a6d42e2a6c090ddd42'
            '10412d168e2aeec3ab1c4c34b0ca8e480ea4ebb124b12f63580b677e5fb8859b'
            'f609d73370ca62925ba8c796afeeb7fb42f4a1569124f84cb25b7026c026d78a')

prepare() {
    chmod +x "${_archive}.AppImage"
    ./"${_archive}".AppImage --appimage-extract
}

package() {
    # License
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
    
    # desktop file
    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

    # Appimage
    install -Dm755 "${srcdir}/${_archive}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    
    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    
    # logo
    cd "${srcdir}/squashfs-root"
    cp -r --parent "usr/share/icons/hicolor" "${pkgdir}/"
#    find "${srcdir}/squashfs-root/usr/share/icons/ -type f -exec install -Dm644 {} test/{} \;
    
}
