# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A proxy client for secure and private internet access"
arch=('x86_64')
url="https://github.com/Happ-proxy/happ-desktop"
license=('custom')
depends=('fuse2' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('happ-desktop')
conflicts=('happ-desktop')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Happ-proxy/happ-desktop/releases/download/alpha_${pkgver}/Happ.linux.x86.v0.7.1.141.AppImage")
sha256sums=('34d5cc9c9f609ba844f2c0ed7953fdbb8083928d30a60696640825f02b9cf76b')
_appimage="${pkgname}-${pkgver}.AppImage"

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract >/dev/null
}

package() {
    # Install AppImage contents
    install -dm755 "${pkgdir}/opt/happ-desktop"
    cp -r squashfs-root/* "${pkgdir}/opt/happ-desktop/"

    # Create executable symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/happ-desktop/AppRun" "${pkgdir}/usr/bin/happ"

    # Install desktop file
    install -Dm644 "squashfs-root/Happ.desktop" "${pkgdir}/usr/share/applications/happ.desktop"

    # Fix desktop file paths
    sed -i "s|Exec=.*|Exec=/usr/bin/happ|" "${pkgdir}/usr/share/applications/happ.desktop"
    sed -i "s|Icon=.*|Icon=happ|" "${pkgdir}/usr/share/applications/happ.desktop"

    # Install icons
    for size in 16 32 48 64 128 256 512; do
        if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/happ.png" ]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/happ.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/happ.png"
        fi
    done

    # Install main icon as fallback
    if [ -f "squashfs-root/happ.png" ]; then
        install -Dm644 "squashfs-root/happ.png" "${pkgdir}/usr/share/pixmaps/happ.png"
    fi
}