# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Maarten de Boer <maarten@cloudstek.nl>
# Contributor: Yakumo Saki <yakumo at ziomatrix dot org>
# Contributor: Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.3.55
pkgrel=1
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('custom')
depends=('gtk3' 'libindicator-gtk2' 'dbus-glib' 'alsa-lib' 'libdbusmenu-gtk2' 'nss')
makedepends=('sed')
options=('!strip')

_filename="$pkgname-desktop-$pkgver-x86_64.AppImage"

source=("${_filename}::https://desktop.clickup.com/linux"
        "terms.html::https://clickup.com/terms")

sha256sums=('7ed8ea0cb8d4faa055bf1cb4ecf2133e5b88c36559c846d6fb1e5c389637e95e'
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
    sed -i -e "s|Exec=.\+|Exec=/usr/bin/${pkgname} %U|" "${pkgdir}/usr/share/applications/ClickUp.desktop"

    # Terms and licenses
    install -Dm0644 "${srcdir}/terms.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSE.electron.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSES.chromium.html -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Icons
    icons=(1024x1024 512x512 256x256 128x128 64x64 48x48 32x32 16x16)

    for size in "${icons[@]}"; do
        install -Dm0644 usr/share/icons/hicolor/${size}/apps/desktop.png -T "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ClickUp.png"
    done

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
