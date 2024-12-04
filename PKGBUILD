# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=warcraftlogsuploader-appimage
_pkgapp=warcraftlogsuploader
pkgver=8.14.44
pkgrel=1
pkgdesc="warcraftlogs.com desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
conflicts=("warcraftlogsuploader")
url="https://warcraftlogs.com/"
source=("${_pkgapp}-1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819.AppImage::https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v8.14.44/warcraftlogs-v8.14.44.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the WarcraftLogs binary, to avoid breakage on updates
sha512sums=('1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819'
            '1f8d504fb27e815f7efcc8e97672bad12f531d171ab8a08c49439fb4ee63b07e9355c49e56b5fb2eb2f6d202ce56a0526b609fef4b6209832026709002eba22a')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819.AppImage
    ${srcdir}/${_pkgapp}-1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/warcraftlogs.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819.AppImage
    ./${_pkgapp}-1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/warcraftlogs.desktop

    install -Dm755 ${_pkgapp}-1f77c0159a13d0a7d27409be17d08c75005d633f603d8e4bb2bccc3639eaaf4fb791d01391f30e279c2b9792ca29250eef8e9b2447b32a42778dd180260a2819.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
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
