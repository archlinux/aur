pkgname=1password
_appimagver=0.9.6
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
sha256sums=('3030306a875ccd97242218f8af56af0c2cdcd0c978fc365c8440bc345a51c410'
            'cee3a7c1309ed2179a985dc3812a6c3a1ec12938e83fa8914f3a4a1d2547731e'
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
