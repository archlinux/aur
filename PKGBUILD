# Maintainer: Fabien Michel <fabien.michel@hespul.org>
_pkgname=wazo-desktop
pkgname=${_pkgname}-appimage
pkgver=1.13.53
pkgrel=1
pkgdesc="Wazo desktop client for wazo VOIP server"
arch=('x86_64')
url="https://wazo.io/download/"
license=('unknown')
provides=(${_pkgname})

_appimage=Wazo-Desktop-${pkgver}.AppImage
_installdir=/opt/${pkgname}
_installappimage=Wazo-Desktop.AppImage
source=("${_appimage}::https://mirror.wazo.io/songbird/${pkgver}/${_appimage}")
noextract=("${_appimage}")
# Require !strip to avoid corrupt AppImage file
# Require !debug to workaround bug making strip still occure.
options=("!strip" "!debug")
sha256sums=('ce9498d2d18c4430c915b52bc03911903034f9e15607a4f6cb83ee49835070a2')

prepare() {
    # Make AppImage executable
    chmod +x "${_appimage}"

    # Extract icons and desktop files from AppImage
    ./${_appimage} --appimage-extract "wazo-desktop.desktop" > /dev/null 2>&1
    ./${_appimage} --appimage-extract "usr/share/icons" > /dev/null 2>&1
    
    # Fix desktop file
    sed -i "s+Exec=AppRun+Exec=${_installdir}/${_installappimage}+" "squashfs-root/wazo-desktop.desktop"
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/${_installdir}/${_installappimage}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/${_installdir}/${_installappimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop file
    install -Dm644 "squashfs-root/wazo-desktop.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    
    # Install icons
    install -dm755 "$pkgdir/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
    chmod -R 755 "$pkgdir/usr/share/icons"
    find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} \;
}
