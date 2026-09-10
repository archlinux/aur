# Maintainer: 1000Hz <1000Hz radiowave + aur at gmail>
pkgname=btrfs-file-restorer
pkgver=1.0.2
pkgrel=1
pkgdesc="A GUI tool to recover files from damaged and unmountable btrfs filesystem"
arch=('x86_64')
url="https://github.com/dsvi/Btrfs-File-Restorer"
license=('zlib')

depends=('hicolor-icon-theme' 'btrfs-progs')

source=("https://github.com/dsvi/Btrfs-File-Restorer/releases/download/v${pkgver}/Btrfs-File-Restorer.AppImage")
sha256sums=('1940cadd0db019454e04c4d0592f50411c21040611d0a6f973871ba7f2fefcea')

build() {
    # Extract the AppImage payload.
    chmod +x "Btrfs-File-Restorer.AppImage"
    ./Btrfs-File-Restorer.AppImage --appimage-extract
}

package() {
    # 1. Install the app (jpackage layout: bin/ launcher + lib/ with app jars and bundled JRE)
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "squashfs-root/bin" "squashfs-root/lib" "${pkgdir}/usr/lib/${pkgname}/"

    # 2. Symlink the launcher into /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/bin/btrfs-file-restorer" "${pkgdir}/usr/bin/btrfs-file-restorer"

    # 3. Install the icon into the standard hicolor directory (512x512)
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -m 644 "squashfs-root/btrfs-file-restorer.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/btrfs-file-restorer.png"

    # 4. Install the desktop file with clean, standard paths
    install -d "${pkgdir}/usr/share/applications"
    sed -e "s|^Exec=.*|Exec=/usr/bin/btrfs-file-restorer|" \
        -e "s|^Icon=.*|Icon=btrfs-file-restorer|" \
        "squashfs-root/btrfs-file-restorer.desktop" \
        > "${pkgdir}/usr/share/applications/btrfs-file-restorer.desktop"
    chmod 644 "${pkgdir}/usr/share/applications/btrfs-file-restorer.desktop"
}
