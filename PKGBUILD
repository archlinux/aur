# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=warcraftlogsuploader-appimage
_pkgapp=warcraftlogsuploader
pkgver=8.15.2
pkgrel=1
pkgdesc="warcraftlogs.com desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
conflicts=("warcraftlogsuploader")
url="https://warcraftlogs.com/"
source=("${_pkgapp}-c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2.AppImage::https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v8.15.2/warcraftlogs-v8.15.2.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the WarcraftLogs binary, to avoid breakage on updates
sha512sums=('c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2'
            '1f8d504fb27e815f7efcc8e97672bad12f531d171ab8a08c49439fb4ee63b07e9355c49e56b5fb2eb2f6d202ce56a0526b609fef4b6209832026709002eba22a')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2.AppImage
    ${srcdir}/${_pkgapp}-c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/warcraftlogs.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2.AppImage
    ./${_pkgapp}-c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/warcraftlogs.desktop

    install -Dm755 ${_pkgapp}-c68f62e475efb893a794532952149d3ca643b8e839182e774f8cb72b6398e74155dc908c93945eef9e0336ee474c15441a0bd1ead621c8a5c4f3f1d8c25596f2.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
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
