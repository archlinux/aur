# Maintainer: Your Name <your.email@example.com>
pkgname=squidservers-bin
_pkgname=squidservers
pkgver=20260524
pkgrel=1
pkgdesc="A tool to easily self-host Minecraft servers without port forwarding"
arch=('x86_64')
url="https://squidservers.com"
license=('custom:All Rights Reserved')
# fuse2 is required to execute AppImages; others ensure Electron UI support
depends=('hicolor-icon-theme' 'fuse2' 'nss' 'libxss' 'gtk3' 'libnotify' 'alsa-lib' 'at-spi2-core' 'libxtst')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

source=("${_pkgname}.AppImage::https://cdn.squidservers.com/squidservers-latest.AppImage")
sha256sums=('59f01142fabf87cdb7b6c16c3bd97f73c95fa04884f91a7e6883c418cbd282fd')

prepare() {
    chmod +x "${_pkgname}.AppImage"
    # Extract AppImage contents to harvest the icon and desktop file safely
    ./${_pkgname}.AppImage --appimage-extract
}

package() {
    msg2 "Installing AppImage binary..."
    install -Dm755 "${srcdir}/${_pkgname}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    msg2 "Creating executable symlink..."
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    msg2 "Installing Desktop Entry..."
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    
    # Force the desktop entry to use our system symlink path
    sed -i "s|Exec=.*|Exec=${_pkgname} %U|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    msg2 "Installing icons..."
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    msg2 "Installing License..."
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
Proprietary license - see squidservers.com
EOF
}
