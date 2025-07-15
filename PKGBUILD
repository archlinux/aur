pkgname=cursor-app
_cursor_version=1.2.4
_cursor_url=https://downloads.cursor.com/production/a8e95743c5268be73767c46944a71f4465d05c90/linux/x64/Cursor-1.2.4-x86_64.AppImage
pkgver=${_cursor_version}
pkgrel=1
pkgdesc="Cursor - AI-first coding environment"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
depends=('fuse2' 'gtk3')
conflicts=('cursor-bin')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::${_cursor_url}" "cursor.png::file://${PWD}/assets/cursor.png" "${pkgname}.desktop.in::file://${PWD}/assets/${pkgname}.desktop.in" "${pkgname}.sh::file://${PWD}/assets/${pkgname}.sh")
noextract=("${_appimage}")
sha512sums_x86_64=('SKIP'
                   'SKIP'
                   'SKIP'
                   'SKIP')

prepare() {
    # Set correct version in .desktop file
    sed "s/@@PKGVERSION@@/${pkgver}/g" "${srcdir}/${pkgname}.desktop.in" > "${srcdir}/cursor-app.desktop"
}

package() {
    # Create directories
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"

    # Install files with proper permissions
    install -m644 "${srcdir}/cursor-app.desktop" "${pkgdir}/usr/share/applications/cursor-app.desktop"
    install -m644 "${srcdir}/cursor.png" "${pkgdir}/usr/share/icons/cursor-app.png"
    install -m755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Install executable to be called 'cursor', that can load user flags from $XDG_CONFIG_HOME/cursor-flags.conf
    install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/cursor"
}

post_install() {
    update-desktop-database -q
    xdg-icon-resource forceupdate
}
