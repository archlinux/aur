# Maintainer: Song Tianlun <songtianlun@frytea.com>
pkgname=seadrive-bin
pkgver=3.0.21
pkgrel=2
pkgdesc="SeaDrive client for Seafile - access your files without syncing to local disk"
arch=('x86_64')
url="https://www.seafile.com/en/seadrive/"
license=('Apache-2.0')
depends=('fuse2' 'hicolor-icon-theme')
provides=('seadrive')
conflicts=('seadrive')
options=('!strip')
source=("SeaDrive-x86_64-${pkgver}.AppImage::https://seafile-downloads.oss-cn-shanghai.aliyuncs.com/SeaDrive-x86_64-${pkgver}.AppImage")
sha256sums=('c63310c836d21c5a588c11c3da7a08d0314dac298e63ed822321e019e563063f')
noextract=("SeaDrive-x86_64-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/SeaDrive-x86_64-${pkgver}.AppImage"
    "${srcdir}/SeaDrive-x86_64-${pkgver}.AppImage" --appimage-extract > /dev/null 2>&1
}

package() {
    # Install AppImage directly
    install -Dm755 "${srcdir}/SeaDrive-x86_64-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/SeaDrive.AppImage"

    # Symlink to PATH
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/SeaDrive.AppImage" "${pkgdir}/usr/bin/seadrive-gui"

    # Install desktop entry from AppImage
    install -Dm644 "${srcdir}/squashfs-root/seadrive.desktop" \
        "${pkgdir}/usr/share/applications/seadrive.desktop"
    # Fix Exec to use our symlink
    sed -i 's|TryExec=seadrive-gui|TryExec=/usr/bin/seadrive-gui|' \
        "${pkgdir}/usr/share/applications/seadrive.desktop"
    sed -i 's|Exec=seadrive-gui|Exec=/usr/bin/seadrive-gui|' \
        "${pkgdir}/usr/share/applications/seadrive.desktop"

    # Install icons from AppImage
    cd "${srcdir}/squashfs-root"
    find usr/share/icons -type f \( -name "*.png" -o -name "*.svg" \) | while read -r icon; do
        install -Dm644 "${icon}" "${pkgdir}/${icon}"
    done
}
