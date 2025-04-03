# Maintainer: Aryan Ghasemi <t.me/gnuphile>
pkgname="reqable-appimage"
pkgver=2.33.8
_pkgname='reqable'
_archive="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Reqable is a new generation API debugging and testing one-stop solution. Reqable fully supports HTTP1 and HTTP2 and partially supports HTTP3(QUIC). Now available on Windows, Mac, Linux, Android and iOS."
arch=('x86_64')
# Appimage should contains exclude "strip" option
options=(!strip !debug)
depends=()
url="https://reqable.com"

conflicts=(${_pkgname})
noextract=( "${_archive}.AppImage" )

source=(
        "${_archive}.AppImage::https://api.reqable.com/download?platform=linux&arch=${arch}&ext=AppImage"
    )
sha256sums=('f27ee5279ee5fc0f24005b317a96d1e02ca19421aedca62720d9582fe6b3a9c3')

prepare() {
    chmod +x "${_archive}.AppImage"
    ./"${_archive}".AppImage --appimage-extract >/dev/null
}

package() {

    # Appimage
    install -Dm755 "${srcdir}/${_archive}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    
    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    
    # logo
    cd "${srcdir}/squashfs-root"
    # desktop file
    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

#    find "${srcdir}/squashfs-root/usr/share/icons/ -type f -exec install -Dm644 {} test/{} \;
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
