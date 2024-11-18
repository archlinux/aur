# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client-appimage
_pkgapp=raiderio-client
pkgver=4.6.2
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'arm64')
depends=("fuse2")
url="https://raider.io/"
source=("$_pkgapp-x86_64.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.6.2/RaiderIO_Installer_Linux_x86_64.AppImage"
        "$_pkgapp-arm64.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.6.2/RaiderIO_Installer_Linux_arm64.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('b91d536e4537d73cad342698def1123e5fda48e46aa93134b3354bbf614ae0b3548b98fafdf1b84b528cf2b7846ff9bef9879bd0eede5048cbbf422fd05322c7'
            '2e2d1571b4fb0181d1e2375d1d9631a89908596c2c96259f889a9880a2cb0137e9da8863087452e44224d2b93f960835f61e930a34a899205e9000beec414cf0'
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
