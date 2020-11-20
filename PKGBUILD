pkgname=1password
_appimagver=0.9.4-1
_appimage="${pkgname}-${_appimagver}.AppImage"
pkgver=${_appimagver//-/_}
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
url='https://1password.com/'
license=('LicenseRef-1Password-Proprietary')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=(!strip)
source=(${_appimage}::https://onepassword.1password.com/linux/appimage/${_appimage}{,.sig})
noextract=("${_appimage}")
sha256sums=('b1548962f7a18e65bf8e9efe88905df2d2690b5a466666ad90877d680c38b3b4'
            '88277bf0749dc46f329468ec0759b151eacce2f4f03f0e217ca8cadc61da8cff'
)
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

prepare() {
    # Enable execution of AppImage
    chmod +x ${_appimage}
    # Extract AppImage into squashfs-root folder
    ./${_appimage} --appimage-extract
    # Set permissions for squashfs-root folder
    chmod -R 755 squashfs-root
}

package() {
    # Go to source directory
    cd "$srcdir"

    # Create directories for installation
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/opt/${pkgname}
    install -d ${pkgdir}/usr/share/icons
    # Install icons
    cp -r squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/
    # Modify .desktop file to run executable instead of AppImage
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|" squashfs-root/${pkgname}.desktop
    # Install desktop file
    install -Dm644 squashfs-root/${pkgname}.desktop -t ${pkgdir}/usr/share/applications/
    # Move package contents to opt
    mv squashfs-root/* ${pkgdir}/opt/${pkgname}
    # Symlink /usr/bin executable to opt
    ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
