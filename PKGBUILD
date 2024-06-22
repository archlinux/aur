# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client-appimage
_pkgapp=raiderio-client
pkgver=4.3.0
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'arm64')
depends=("fuse2")
url="https://raider.io/"
source=("$_pkgapp-x86_64.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.3.0/RaiderIO_Installer_Linux_x86_64.AppImage"
        "$_pkgapp-arm64.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.3.0/RaiderIO_Installer_Linux_arm64.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('b9e163a1faf2cdd1b4c7c01e0c8bbe619a95d81d9193e571c994cd7033e9f20cf4e61b4297456397d14b55bab44c9c18f597c93258fd0b2a40aecc713790bb8a'
            'd2e9efdfc7ee1dae1c1d1b745d177e0fdeaecfa3b31a311dc4da6c003b832f4341c3e43782f52e1c85a64d9686a2fad0ce6fb7ae500d5b3a339ec65946f67ed8'
            'ee0cb07b4bf56ed43bf163f0141d5165889b051fe0aaf52f46789f67f6ab896f7d69c3527ab77bb1fd70e3c7c6a6611e691fd8ad91edd1db35a2252f10bef9a9')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}.AppImage
    ${srcdir}/${_pkgapp}-${CARCH}.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/${_pkgapp}.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}.AppImage
    ./${_pkgapp}-${CARCH}.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/${_pkgapp}.desktop

    install -Dm755 ${_pkgapp}-${CARCH}.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
    install -Dm755 "start" "${pkgdir}/usr/bin/${_pkgapp}"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgapp}/"

    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/${_pkgapp}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/${_pkgapp}.desktop" "${pkgdir}/usr/share/applications/"
    for i in ${srcdir}/squashfs-root/LICENSE.*; do 
      cp --no-preserve=mode,ownership "${i}" "${pkgdir}/usr/share/licenses/${_pkgapp}"
    done
}
