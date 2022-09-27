# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Contributor: Yakumo Saki <yakumo at ziomatrix dot org>
# Contributor: Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.1.1
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

sha256sums=('197b305f9b1e015c9e2dc25b139b41da65f220b3a37797c9c3e4317041b9e057'
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
    ln -s /opt/clickup/ClickUp "${pkgdir}/usr/bin/clickup"

    # Desktop entry and icons
    sed -i -e "s|Exec=.\+|Exec=/usr/bin/${pkgname} %U|" ClickUp.desktop
    install -Dm0644 ClickUp.desktop -t "${pkgdir}/usr/share/applications/"

    # Terms and licenses
    install -Dm0644 "${srcdir}/terms.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSE.electron.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSES.chromium.html -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Icons
    icons=(1024x1024 512x512 256x256 128x128 64x64 48x48 32x32 16x16)

    for size in "${icons[@]}"; do
        install -Dm0644 usr/share/icons/hicolor/${size}/apps/ClickUp.png -t "${pkgdir}/usr/share/icons/hicolor/${size}/apps/"
    done

    # AppDir contents
    cd "${srcdir}"
    install -dm0755 "${pkgdir}/opt"
    mv squashfs-root "${pkgdir}/opt/clickup"
    chmod 755 "${pkgdir}/opt/clickup"
    chmod a+rX "${pkgdir}/opt/clickup/"

    # Clean up files
    rm -r "${pkgdir}/opt/clickup/usr/share/"
    rm "${pkgdir}/opt/clickup/AppRun" "${pkgdir}/opt/clickup/ClickUp.desktop"
    rm "${pkgdir}/opt/clickup/ClickUp.png" "${pkgdir}/opt/clickup/.DirIcon"
    rm "${pkgdir}/opt/clickup/LICENSE.electron.txt" "${pkgdir}/opt/clickup/LICENSES.chromium.html"
}
