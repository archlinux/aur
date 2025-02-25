# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client
_pkgapp=raiderio-client
pkgver=4.7.1
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'arm64')
depends=("fuse2")
url="https://raider.io/"
source=("$_pkgapp-x86_64-v4.7.1.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.7.1/RaiderIO_Installer_Linux_x86_64.AppImage"
        "$_pkgapp-arm64-v4.7.1.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.7.1/RaiderIO_Installer_Linux_arm64.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('4a4e14c3296b4b7569356be8591473011498d3ba8dfcb9d940098a8de40302c4e2e73873b417628c8b47eecb241c9e6ccd2898e91a1719e2c89bd4f46e1d46d9'
            '2c80061d4aa786c360bbbadc1ba0e711436ef8fb8487b6f4b39f85dae35adc5e66f986c38f68011969b2388e5c8b81bbf88395369f416bec484e67c5304d756f'
            'ee0cb07b4bf56ed43bf163f0141d5165889b051fe0aaf52f46789f67f6ab896f7d69c3527ab77bb1fd70e3c7c6a6611e691fd8ad91edd1db35a2252f10bef9a9')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v4.7.1.AppImage
    ${srcdir}/${_pkgapp}-${CARCH}-v4.7.1.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/${_pkgapp}.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v4.7.1.AppImage
    ./${_pkgapp}-${CARCH}-v4.7.1.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/${_pkgapp}.desktop

    install -Dm755 ${_pkgapp}-${CARCH}-v4.7.1.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
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
