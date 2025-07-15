# Maintainer: mazix (mazix@bk.ru)

pkgname=cursor-app
_cursor_version=1.2.4
_cursor_url=https://downloads.cursor.com/production/a8e95743c5268be73767c46944a71f4465d05c90/linux/x64/Cursor-1.2.4-x86_64.AppImage
pkgver=${_cursor_version}
pkgrel=2
pkgdesc="Cursor - AI-first coding environment"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Anysphere-Inc')

depends=(
    'fuse2'
    'gtk3'
    'glib2'
    'hicolor-icon-theme'
    'ffmpeg'
    'libxkbfile'
)

optdepends=(
    'libcups: for printing functionality'
    'libxss: for screenshot functionality'
    'libdrm: for hardware acceleration'
    'mesa: for OpenGL support'
    'nss: for network security'
)

conflicts=('cursor-bin')
provides=('cursor')
options=(!strip)

_appimage="${pkgname}-${pkgver}.AppImage"

source=(
    "${_appimage}::${_cursor_url}"
    "cursor.png"
    "cursor-app.desktop.in"
    "cursor-app.sh"
)

noextract=("${_appimage}")

sha512sums=(
    'SKIP'
    '2d67f603368a1114c876ca3dc85219674e83becf79bcd3919c6c886d25a1a5ef6b0624775f01eae3c551dc38f9d4de038214604ca38b7e4e8e959a23426df5a9'
    '9a3c37b50ba07faf7b1742ac6cc1be38135cde9af49287222f361aa959ccc6264fff63dc5256adbc08d6f33ffbb82e249f01743f3a12cd7cfa5bd27f89f3f6a5'
    '15dbbb4d0964113d9f64ac24c8cd8f9c0aa92fabc1485c0ba1f7aa12ea32c9aa4da96759d75469c05bf24a278c679e6d3c52646b162a87829fa1aae34616a6eb'
)
prepare() {
    if [[ ! -f "${srcdir}/${_appimage}" ]]; then
        echo "ERROR: AppImage file not found: ${_appimage}" >&2
        return 1
    fi
    
    # Follow symbolic link and check if file is ELF format
    if ! file -L "${srcdir}/${_appimage}" | grep -q "ELF"; then
        echo "ERROR: Downloaded file is not a valid ELF file" >&2
        return 1
    fi
    
    # Ensure the AppImage has execute permissions (follow symlink)
    chmod +x "${srcdir}/${_appimage}"
    
    sed "s/@@PKGVERSION@@/${pkgver}/g" "${srcdir}/cursor-app.desktop.in" > "${srcdir}/cursor-app.desktop"

    if [[ ! -f "${srcdir}/cursor-app.desktop" ]]; then
        echo "ERROR: Failed to generate desktop file" >&2
        return 1
    fi
}

build() {
    echo "-> No build step required for AppImage package"
}

check() {
    echo "-> Validating package files..."
    
    if command -v desktop-file-validate &>/dev/null; then
        desktop-file-validate "${srcdir}/cursor-app.desktop" || \
            echo "WARNING: Desktop file validation failed" >&2
    fi
    
    if [[ ! -f "${srcdir}/cursor.png" ]]; then
        echo "WARNING: Icon file not found: cursor.png" >&2
    fi
    
    if [[ ! -f "${srcdir}/cursor-app.sh" ]]; then
        echo "ERROR: Launcher script not found: cursor-app.sh" >&2
        return 1
    fi
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -m644 "${srcdir}/cursor-app.desktop" "${pkgdir}/usr/share/applications/"
    install -m644 "${srcdir}/cursor.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cursor-app.png"
    install -m755 "${srcdir}/cursor-app.sh" "${pkgdir}/usr/bin/cursor"
}

post_install() {
    if command -v update-desktop-database &>/dev/null; then
        update-desktop-database -q /usr/share/applications
    fi
    if command -v gtk-update-icon-cache &>/dev/null; then
        gtk-update-icon-cache -q /usr/share/icons/hicolor
    fi
    echo "-> Cursor has been installed successfully!"
    echo "-> You can start it by running 'cursor' or through your application menu."
}

post_upgrade() {
    post_install
}

post_remove() {
    if command -v update-desktop-database &>/dev/null; then
        update-desktop-database -q /usr/share/applications
    fi
    if command -v gtk-update-icon-cache &>/dev/null; then
        gtk-update-icon-cache -q /usr/share/icons/hicolor
    fi
    echo "-> Cursor has been removed."
}