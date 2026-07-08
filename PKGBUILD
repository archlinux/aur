# Maintainer: edoaurahman <edoaurahman@gmail.com>

pkgname=clickup-desktop
pkgver=3.5.230
pkgrel=1
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('CustomLicense')
provides=('clickup')
conflicts=('clickup')
depends=(
	'alsa-lib'
	'dbus-glib'
	'gtk3'
	'libdbusmenu-gtk3'
	'libindicator-gtk3'
	'libsecret'
	'libxkbfile'
	'nss'
)
makedepends=('sed')
options=('!strip')

_filename="clickup-desktop-$pkgver-x86_64.AppImage"

source=("${_filename}::https://desktop.clickup.com/linux")

sha256sums=('SKIP')

prepare() {
    rm -rf squashfs-root
    chmod +x $_filename
    ./$_filename --appimage-extract

    find squashfs-root -type d -exec chmod a+rx {} \;
}

package() {
    cd "${srcdir}/squashfs-root"

    install -dm0755 "${pkgdir}/usr/bin"
    ln -s /opt/clickup/desktop "${pkgdir}/usr/bin/clickup"

    install -Dm0644 desktop.desktop -T "${pkgdir}/usr/share/applications/ClickUp.desktop"
    sed -i \
        -e "s|^Exec=.\+|Exec=/usr/bin/clickup %U|" \
        -e "s|^Icon=.\+|Icon=ClickUp|" \
        "${pkgdir}/usr/share/applications/ClickUp.desktop"

    install -Dm0644 LICENSE.electron.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSES.chromium.html -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    icons=(512x512 256x256 128x128 64x64 48x48 32x32 16x16)

    for size in "${icons[@]}"; do
        install -Dm0644 usr/share/icons/hicolor/${size}/apps/desktop.png -T "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ClickUp.png"
    done

    cd "${srcdir}"
    install -dm0755 "${pkgdir}/opt"
    mv squashfs-root "${pkgdir}/opt/clickup"
    chmod 755 "${pkgdir}/opt/clickup"
    chmod a+rX "${pkgdir}/opt/clickup/"

    rm -r "${pkgdir}/opt/clickup/usr/share/"
    rm "${pkgdir}/opt/clickup/AppRun" "${pkgdir}/opt/clickup/desktop.desktop"
    rm "${pkgdir}/opt/clickup/desktop.png" "${pkgdir}/opt/clickup/.DirIcon"
    rm "${pkgdir}/opt/clickup/LICENSE.electron.txt" "${pkgdir}/opt/clickup/LICENSES.chromium.html"
}
