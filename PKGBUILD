# Maintainer: Qingxu <me@linioi.com>
pkgname=switchhosts-appimage
pkgver=4.0.2
_subpkgver="6057"
pkgrel=3
pkgdesc="An App for hosts management & switching."
arch=('x86_64')
url="https://github.com/oldj/SwitchHosts"
license=('Apache')
conflicts=(
    'switchhosts-bin'
    'switchhosts'
)
options=(!strip)
depends=("fuse2")
source=("SwitchHosts.AppImage::https://github.com/oldj/SwitchHosts/releases/download/v${pkgver}/SwitchHosts_linux_${pkgver}.${_subpkgver}.AppImage")
md5sums=("e8828538fb28f95ef3df8f630ef50f70")

prepare() {
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
    install -dm755 "$pkgdir/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
    chmod -R 755 "$pkgdir/usr/share/icons"
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