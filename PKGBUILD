# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client
_pkgapp=raiderio-client
pkgver=4.10.0
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'arm64')
depends=("fuse2")
url="https://raider.io/"
source=("$_pkgapp-x86_64-v4.10.0.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.10.0/RaiderIO_Installer_Linux_x86_64.AppImage"
        "$_pkgapp-arm64-v4.10.0.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v4.10.0/RaiderIO_Installer_Linux_arm64.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('0c5b04d28e58e95781cb61482409cf29bb379a0aea74c67b355cb03ef17c6e0908e291f90f8e12b91bedabda164c8b320b578ce28a6337e9b33fff375b47acef'
            'c47db228c7d0052c41d6a39faa84e212dda2f0141ecf7bb5a1c5f3d0e3c6d783d8faba7a2b1967e01f2b84665747958f85020f64dbad8f48c6eeac756a1322b6'
            'ee0cb07b4bf56ed43bf163f0141d5165889b051fe0aaf52f46789f67f6ab896f7d69c3527ab77bb1fd70e3c7c6a6611e691fd8ad91edd1db35a2252f10bef9a9')

pkgver() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v4.10.0.AppImage
    ${srcdir}/${_pkgapp}-${CARCH}-v4.10.0.AppImage --appimage-extract >/dev/null
    cat ${srcdir}/squashfs-root/${_pkgapp}.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v4.10.0.AppImage
    ./${_pkgapp}-${CARCH}-v4.10.0.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/${_pkgapp}.desktop

    install -Dm755 ${_pkgapp}-${CARCH}-v4.10.0.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
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
