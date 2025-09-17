# Maintainer: Eddi Sanchez <eddi at heyeddi dot com>
pkgname=clickup-desktop-fixed
pkgver=3.5.139
pkgrel=1
pkgdesc="Desktop app for clickup.com with GTK3 and icon fixes"
arch=('x86_64')
url="https://clickup.com"
license=('CustomLicense')
provides=('clickup')
conflicts=('clickup')
depends=(
	'alsa-lib'
	'dbus-glib'
	'gtk3'
	'libdbusmenu-gtk2'
	'libindicator-gtk2'
	'libsecret'
	'libxkbfile'
	'nss'
)
makedepends=('sed')
options=('!strip')

_filename="clickup-desktop-$pkgver-x86_64.AppImage"

source=("${_filename}::https://desktop.clickup.com/linux"
        "terms.html::https://clickup.com/terms")

sha256sums=('2a01642451610460a84a34e9c7cd6f79eb6b9ab8590b975bb440aff6b426a51e'
            'SKIP')

prepare() {
    rm -rf squashfs-root
    chmod +x $_filename
    ./$_filename --appimage-extract

    # Fix directory permissions (read + execute)
    find squashfs-root -type d -exec chmod a+rx {} \;
}

package() {
    cd "${srcdir}/squashfs-root"

    # Symlink to /usr/bin
    install -dm0755 "${pkgdir}/usr/bin"
    ln -s /opt/clickup/desktop "${pkgdir}/usr/bin/clickup"

    # Desktop entry and icons
    install -Dm0644 desktop.desktop -T "${pkgdir}/usr/share/applications/ClickUp.desktop"
    # CRITICAL FIX: Add --gtk-version=3 flag for proper GTK3 operation
    sed -i -e "s|Exec=.\+|Exec=/usr/bin/clickup --gtk-version=3 %U|" "${pkgdir}/usr/share/applications/ClickUp.desktop"
    # CRITICAL FIX: Fix icon reference to match installed icon names
    sed -i -e "s|Icon=.\+|Icon=ClickUp|" "${pkgdir}/usr/share/applications/ClickUp.desktop"

    # Terms and licenses
    install -Dm0644 "${srcdir}/terms.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSE.electron.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSES.chromium.html -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Icons - with conditional installation for robustness
    icons=(1024x1024 512x512 256x256 128x128 64x64 48x48 32x32 16x16)

    for size in "${icons[@]}"; do
        if [[ -f "usr/share/icons/hicolor/${size}/apps/desktop.png" ]]; then
            install -Dm0644 "usr/share/icons/hicolor/${size}/apps/desktop.png" -T "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ClickUp.png"
        fi
    done

    # Fallback: use the main desktop.png if specific sizes aren't available
    if [[ -f "desktop.png" && ! -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ClickUp.png" ]]; then
        install -Dm0644 "desktop.png" -T "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ClickUp.png"
    fi

    # AppDir contents
    cd "${srcdir}"
    install -dm0755 "${pkgdir}/opt"
    mv squashfs-root "${pkgdir}/opt/clickup"
    chmod 755 "${pkgdir}/opt/clickup"
    chmod a+rX "${pkgdir}/opt/clickup/"

    # Clean up files
    rm -r "${pkgdir}/opt/clickup/usr/share/"
    rm "${pkgdir}/opt/clickup/AppRun" "${pkgdir}/opt/clickup/desktop.desktop"
    rm "${pkgdir}/opt/clickup/desktop.png" "${pkgdir}/opt/clickup/.DirIcon"
    rm "${pkgdir}/opt/clickup/LICENSE.electron.txt" "${pkgdir}/opt/clickup/LICENSES.chromium.html"
}
