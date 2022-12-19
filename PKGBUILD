# Maintainer: Qingxu <me@linioi.com>
pkgname=switchhosts-appimage
pkgver=4.1.2
_subpkgver="6086"
pkgrel=2
pkgdesc="An App for hosts management & switching."
arch=('x86_64')
url="https://github.com/oldj/SwitchHosts"
license=('Apache')
provides=('switchhosts')
conflicts=(
    'switchhosts-bin'
    'switchhosts'
)
options=(!strip)
depends=("fuse2")
source=(
    "SwitchHosts_linux_${pkgver}.${_subpkgver}.AppImage::https://github.com/oldj/SwitchHosts/releases/download/v${pkgver}/SwitchHosts_linux_${arch}_${pkgver}.${_subpkgver}.AppImage"
    )
sha256sums=(
    '12e69a01d9325f780ee387413124bbc6dee070610c7e22af5815cf74c56468aa'
    )

prepare() {
    mv -f "SwitchHosts_linux_${pkgver}.${_subpkgver}.AppImage" "SwitchHosts.AppImage"
    chmod +x "SwitchHosts.AppImage"
    ./"SwitchHosts.AppImage" --appimage-extract "usr/share/icons/hicolor/*/apps/switchhosts.png" > /dev/null 2>&1
    ./"SwitchHosts.AppImage" --appimage-extract switchhosts.desktop > /dev/null 2>&1
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=/opt/appimages/SwitchHosts.AppImage|" squashfs-root/switchhosts.desktop
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    # Install AppImage
    install -Dm755 "${srcdir}/SwitchHosts.AppImage" "${pkgdir}/opt/appimages/SwitchHosts.AppImage"

    # Install Desktop file
    install -Dm644 "${srcdir}/squashfs-root/switchhosts.desktop" "${pkgdir}/usr/share/applications/switchhosts.desktop"

    # Install Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/switchhosts.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
}

post_install() {
    # Link to the binary
    ln -sf '/opt/appimages/SwitchHosts.AppImage' '/usr/bin/switchhosts'

    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
}

post_remove() {
    rm -f '/usr/bin/switchhosts'
}
