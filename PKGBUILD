# Maintainer: Felix Serrano Blanco <felixseblanc@gmail.com>

pkgname="deezloader-remix-bin"
_pkgname="deezloader-remix"
pkgver=4.2.0
pkgrel=1
pkgdesc="Deezloader Remix is an improved version of Deezloader based on the Reborn branch. With this app you can download songs, playlists and albums directly from Deezer's Server in a single and well packaged app."
arch=('x86_64' 'i686')
url="https://notabug.org/RemixDevs/DeezloaderRemix"
license=('GPL')
conflicts=('deezloader-remix-git')
source_x86_64=(${_pkgname}.AppImage::https://www.dropbox.com/s/dmvkws1eg5gzot8/Deezloader%20Remix%20${pkgver}.appimage?dl=0)
source_i686=(${_pkgname}.AppImage::https://www.dropbox.com/s/i7v6aj4yyc7tc7o/Deezloader%20Remix%20${pkgver}%20i386.appimage?dl=0)
options=(!strip)
md5sums_x86_64=('20a6c5f0f755ec7ee50ce1d7714086ea')
md5sums_i686=('94a3bf9c02469d90975b252e539dee8b')

package() {
    msg2 "Extracting the AppImage..."
    install -d "${pkgdir}/opt/${_pkgname}"
    cd ${srcdir}
    chmod +x "${_pkgname}.AppImage"
    "./${_pkgname}.AppImage" --appimage-extract

    # Coping to opt
    find squashfs-root -type d -exec chmod 755 {} \;
    cp -r squashfs-root/* "${pkgdir}/opt/${_pkgname}" -R
    rm "${pkgdir}/opt/${_pkgname}/AppRun"

    # Fixing desktop file
    sed -i "/Exec=AppRun/c\Exec=/usr/bin/${_pkgname} %U" "${pkgdir}/opt/${_pkgname}/deezloader-rmx.desktop"
    sed -i "/Icon=deezloader-rmx/c\Icon=${_pkgname}" "${pkgdir}/opt/${_pkgname}/deezloader-rmx.desktop"
    install -d "${pkgdir}/usr/share/applications"
    ln -s "/opt/${_pkgname}/deezloader-rmx.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    msg2 "Creating symbolic links..."
    # Launcher
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/deezloader-rmx" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${i}/apps"
        ln -s "/opt/${_pkgname}/usr/share/icons/hicolor/${i}/apps/deezloader-rmx.png" \
              "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done

    # Licenses
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    ln -s "/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}