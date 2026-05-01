# Maintainer: dalmatheo <aur@dalmatheo.dev>

pkgname=creamlinux-installer-bin
pkgver=1.5.5
pkgrel=3
pkgdesc="CreamLinux is a GUI application for Linux that simplifies the management of DLC IDs in Steam games. It provides a user-friendly interface to install and configure CreamAPI (for native Linux games) and SmokeAPI (for Windows games running through Proton)."
arch=('x86_64')
url="https://github.com/Novattz/creamlinux-installer"
license=('MIT')

# These dependencies are based on namcap analysis of the pre-compiled binary.
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'openssl'
    'glib2'
    'glibc'
    'cairo'
    'gdk-pixbuf2'
    'libgcc'
    'hicolor-icon-theme'
)

provides=("creamlinux")
conflicts=("creamlinux")

# !debug is used because this is a pre-compiled binary; we cannot generate debug symbols.
options=('!debug')

sha256sums=('413ab8f14cca7a27ebd505107e84a4d8a62ce11c78e6f8ae161436ac2c54906f'
            '3acdaff189f797ae7b160a1e1d32081ba141599afc5a4210eba78ff182003977')

source=(
    "https://github.com/Novattz/creamlinux-installer/releases/download/v${pkgver}/Creamlinux_${pkgver}_amd64.deb"
    "https://raw.githubusercontent.com/Novattz/creamlinux-installer/main/LICENSE.md"
)

package() {
    bsdtar -xf "Creamlinux_${pkgver}_amd64.deb"
    for f in data.tar.*; do
        bsdtar -xf "${f}"
    done

    install -Dm755 "usr/bin/creamlinux" "${pkgdir}/usr/bin/creamlinux" 

    mkdir -p "${pkgdir}/usr/share/applications/"
    sed -e 's|Icon=.*|Icon=creamlinux|' \
        -e 's|Name\[.*\]=.*|Name=Creamlinux|' \
        "usr/share/applications/Creamlinux.desktop" > "${pkgdir}/usr/share/applications/creamlinux.desktop"

    local _icon_sizes=("128x128" "512x512" "256x256@2")
    for _size in "${_icon_sizes[@]}"; do
        install -Dm644 "usr/share/icons/hicolor/${_size}/apps/creamlinux.png" \
                       "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/creamlinux.png"
    done

    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
