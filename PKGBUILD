# Maintainer: Slava Gurin <vyacheslavnexus@gmail.com>
pkgname=yaas-nightly-bin
_pkgname=yaas
pkgver=2026.06.26
pkgrel=4
pkgdesc="Cross-platform desktop application for sideloading apps and managing Meta Quest headsets (Nightly Binary)"
arch=('x86_64')
url="https://github.com/skrimix/yaas"
license=('MIT')
depends=('gtk3' 'mpv' 'libxss' 'hicolor-icon-theme' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-bin")
options=('!strip')
install="${pkgname}.install"

source=("${pkgname}-${pkgver}.AppImage::https://github.com/skrimix/yaas/releases/download/nightly/YAAS-linux-x86_64.AppImage")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/opt/${_pkgname}"
    cp -Rp squashfs-root/* "${pkgdir}/opt/${_pkgname}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    if [ -f "squashfs-root/yaas.desktop" ]; then
        install -Dm644 squashfs-root/yaas.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

        # Указываем абсолютный путь к иконке в /opt/yaas/yaas.png
        sed -i "s|Icon=.*|Icon=/opt/${_pkgname}/${_pkgname}.png|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    fi

    # Иконки в системные директории можно все равно скопировать для совместимости
    if [ -f "squashfs-root/yaas.png" ]; then
        install -Dm644 squashfs-root/yaas.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
        install -Dm644 squashfs-root/yaas.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
        install -Dm644 squashfs-root/yaas.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    fi
}
