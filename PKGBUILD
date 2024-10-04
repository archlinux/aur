# Maintainer: Aryan Ghasemi <t.me/gnuphile>
pkgname="hiddify-next-appimage"
pkgver=2.5.7
_pkgname='hiddify'
_archive="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s open-source, secure and ad-free. "
arch=('x86_64')
# Appimage should contains exclude "strip" option
options=(!strip !debug)
depends=( hicolor-icon-theme zlib glibc )
url="https://github.com/hiddify/hiddify-next"
license=('CC-BY-NC-SA-4.0')
LDFLAGS=' -Wl,-z,cet-report=error'
conflicts=('hiddify-next-bin' 'hiddify-next-git')
noextract=( "${_archive}.AppImage" )
source=(
        "${_archive}.AppImage::https://github.com/hiddify/hiddify-next/releases/download/v${pkgver}/Hiddify-Linux-x64.AppImage"
        "hiddify.desktop"
        "LICENSE.md")
sha256sums=('e51a99e9ecaead1b683954c12d9aa80be00d8b8bcc3838e50567f7578197b4c8'
            '10412d168e2aeec3ab1c4c34b0ca8e480ea4ebb124b12f63580b677e5fb8859b'
            'f609d73370ca62925ba8c796afeeb7fb42f4a1569124f84cb25b7026c026d78a')

prepare() {
    chmod +x "${_archive}.AppImage"
    ./"${_archive}".AppImage --appimage-extract >/dev/null
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
