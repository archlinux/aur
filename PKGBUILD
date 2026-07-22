# Maintainer: Your Name <1000Hz radiowave + aur at gmail>
pkgname=btrfs-file-restorer
pkgver=1.0.0
pkgrel=1
pkgdesc="A GUI tool to recover files from damaged and unmountable btrfs filesystem"
arch=('x86_64')
url="https://github.com/dsvi/Btrfs-File-Restorer"
license=('zlib')

depends=('hicolor-icon-theme' 'btrfs-progs')
makedepends=('binutils')

source=("https://github.com/dsvi/Btrfs-File-Restorer/releases/download/v${pkgver}/btrfs-file-restorer_${pkgver}-1_amd64.deb")
sha256sums=('b20dae6a11694fa564534441b9e5daf19b03873360439debfd93a316bad8d70f')

package() {
    # 1. Extract the .deb archive
    ar x "btrfs-file-restorer_${pkgver}-1_amd64.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"
    rm -f control.tar.* data.tar.* debian-binary

    # 2. Move the entire app from /opt to /usr/lib
    install -d "${pkgdir}/usr/lib"
    mv "${pkgdir}/opt/btrfs-file-restorer" "${pkgdir}/usr/lib/"
    rmdir "${pkgdir}/opt"

    # 3. Symlink the binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/btrfs-file-restorer/bin/btrfs-file-restorer" "${pkgdir}/usr/bin/btrfs-file-restorer"

    # 4. Move the icon to the standard hicolor directory
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    mv "${pkgdir}/usr/lib/btrfs-file-restorer/lib/btrfs-file-restorer.png" \
       "${pkgdir}/usr/share/icons/hicolor/256x256/apps/btrfs-file-restorer.png"

    # 5. Patch and install the desktop file
    # (Note: We still use a quick 'find' for the .desktop file only, because
    # jpackage inconsistently places it in either /opt/... or /usr/share/applications/)
    install -d "${pkgdir}/usr/share/applications"
    local _desktop_file=$(find "${pkgdir}" -name "*.desktop" -type f | head -n 1)

    if [ -n "${_desktop_file}" ]; then
        # Overwrite Exec and Icon lines with clean, standard paths
        sed -i "s|^Exec=.*|Exec=/usr/bin/btrfs-file-restorer|g" "${_desktop_file}"
        sed -i "s|^Icon=.*|Icon=btrfs-file-restorer|g" "${_desktop_file}"

        # Move to standard location and ensure it has the clean name
        mv "${_desktop_file}" "${pkgdir}/usr/share/applications/btrfs-file-restorer.desktop"
        chmod 644 "${pkgdir}/usr/share/applications/btrfs-file-restorer.desktop"
    fi
}
