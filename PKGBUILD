# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=warcraftlogsuploader-appimage
_pkgapp=warcraftlogsuploader
pkgver=8.14.49
pkgrel=1
pkgdesc="warcraftlogs.com desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
conflicts=("warcraftlogsuploader")
url="https://warcraftlogs.com/"
source=("${_pkgapp}-f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184.AppImage::https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v8.14.49/warcraftlogs-v8.14.49.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the WarcraftLogs binary, to avoid breakage on updates
sha512sums=('f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184'
            '1f8d504fb27e815f7efcc8e97672bad12f531d171ab8a08c49439fb4ee63b07e9355c49e56b5fb2eb2f6d202ce56a0526b609fef4b6209832026709002eba22a')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184.AppImage
    ${srcdir}/${_pkgapp}-f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/warcraftlogs.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184.AppImage
    ./${_pkgapp}-f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/warcraftlogs.desktop

    install -Dm755 ${_pkgapp}-f59a7b74e689a5ef5507569ce266174c4b666250e02013cc89be8dd9264d425ed030b7317018f19edafe297bb7fc531e749fd3c149d9ff6027c5ef303308a184.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
    install -Dm755 "start" "${pkgdir}/usr/bin/${_pkgapp}"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgapp}/"

    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/warcraftlogs.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/warcraftlogs.desktop" "${pkgdir}/usr/share/applications/"
    for i in ${srcdir}/squashfs-root/LICENSE.* ${srcdir}/squashfs-root/LICENSES.*; do 
      cp --no-preserve=mode,ownership "${i}" "${pkgdir}/usr/share/licenses/${_pkgapp}"
    done
}
