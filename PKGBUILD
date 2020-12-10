pkgname=cajviewer-appimage
_installdir=/opt/${pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="CAJViewer for Linux"
arch=("x86_64")
url="http://cajviewer.cnki.net"
_pkgname="CAJViewer-x86_64-libc-2.24.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=('cajviewer')
conflicts=('cajviewer')
source=("http://viewer.d.cnki.net/${_pkgname}")
sha256sums=("2ee4ca35cc031ebdc413bcb46d63bb1b7f720c7a9db45641e25614f589f4933f")

prepare() {
    cd "${srcdir}"
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+Exec=cajviewer+Exec=env DESKTOPINTEGRATION=no ${_installdir}/${_pkgname} %U+" "squashfs-root/cajviewer.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_pkgname}"
    install -Dm644 "squashfs-root/cajviewer.desktop" "${pkgdir}/usr/share/applications/cajviewer.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
