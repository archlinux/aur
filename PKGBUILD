# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client
_pkgapp=raiderio-client
pkgver=4.11.2
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'arm64')
depends=("fuse2")
url="https://raider.io/"
source=("$_pkgapp-x86_64-v4.11.2.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.11.2/RaiderIO_Installer_Linux_x86_64.AppImage"
        "$_pkgapp-arm64-v4.11.2.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.11.2/RaiderIO_Installer_Linux_arm64.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('0977e43c1e36324f105b2dc612035136b9d947be450fd3155240662b5a271fe56bc2fe85b1c73c5c460e23079dfd82ec260fcc82e877546aeedbfee756e7c32a'
            '8648df97cebd6ad6180a6b625e6c87ada942bfe4dbbfaa3724b0b6741bea4500450bd87278a4f6cd71e0bc303ca364faee38fc30395bbcd6187a70a749d642f6'
            'ee0cb07b4bf56ed43bf163f0141d5165889b051fe0aaf52f46789f67f6ab896f7d69c3527ab77bb1fd70e3c7c6a6611e691fd8ad91edd1db35a2252f10bef9a9')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v4.11.2.AppImage
    ${srcdir}/${_pkgapp}-${CARCH}-v4.11.2.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/${_pkgapp}.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v4.11.2.AppImage
    ./${_pkgapp}-${CARCH}-v4.11.2.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/${_pkgapp}.desktop

    install -Dm755 ${_pkgapp}-${CARCH}-v4.11.2.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
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
