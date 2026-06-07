# Maintainer Siiire <siiire@pm.me>
pkgname=jellyfin-desktop-git-bin
pkgver=20260607
pkgrel=1
pkgdesc="Jellyfin Desktop Client (Pre-compiled nightly AppImage)"
arch=('x86_64')
url="https://github.com/jellyfin/jellyfin-desktop"
license=('GPL2')
provides=('jellyfin-desktop' 'jellyfin-desktop-git' 'jellyfin-desktop-cef-git')
conflicts=('jellyfin-desktop' 'jellyfin-desktop-git' 'jellyfin-desktop-cef-git')
options=('!strip')

source=("jellyfin-desktop-nightly.zip::https://nightly.link/jellyfin/jellyfin-desktop/workflows/build-linux-appimage/main/linux-appimage-x86_64.zip")
sha256sums=('SKIP') 

prepare() {
    _appimage=$(find "${srcdir}" -name "*.AppImage" -print -quit)
    chmod +x "$_appimage"
    cd "${srcdir}"
    "$_appimage" --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r * "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/jellyfin-desktop"
    install -d "${pkgdir}/usr/share/applications"
    _desktop=$(find . -maxdepth 1 -name "*.desktop" -print -quit)
    if [ -n "$_desktop" ]; then
        _desktop_name=$(basename "$_desktop")
        install -m644 "$_desktop" "${pkgdir}/usr/share/applications/${_desktop_name}"
        sed -i 's/^Exec=.*/Exec=\/usr\/bin\/jellyfin-desktop %U/' "${pkgdir}/usr/share/applications/${_desktop_name}"
    fi
    _icon=$(find . -maxdepth 1 \( -name "*.png" -o -name "*.svg" \) -print -quit)
    if [ -n "$_icon" ]; then
        _icon_name=$(basename "$_icon")
        if [[ "$_icon_name" == *.svg ]]; then
            install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
            install -m644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_icon_name}"
        else
            install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
            install -m644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_icon_name}"
        fi
    fi
}
