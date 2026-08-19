# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>

pkgname=eez-studio-appimage
pkgver=0.29.0
pkgrel=1
pkgdesc="Cross-platform low-code GUI and automation"
arch=('x86_64' 'aarch64')
url="https://github.com/eez-open/studio/releases"
license=('GPL')
options=(!strip)

depends=(
    'nss'
    'atkmm'
    'cups'
    'gtk3'
    'alsa-lib'
    'python'
)

source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/eez-open/studio/releases/download/v${pkgver}/EEZ-Studio-${pkgver}.AppImage"
)

sha256sums=('25bf62a1ed6e598901901c29e859f995ca768a451779e105463dca336b497552')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    cd "${srcdir}"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

build() {
    sed -i "s|Exec=AppRun|Exec=${pkgname%-appimage}|" "${srcdir}/squashfs-root/EEZ Studio.desktop"
}

package() {
    # Create the application directory
    mkdir -p "${pkgdir}/opt/${pkgname}"

    # Copy extracted AppImage contents to /opt/${pkgname}
    # The trailing dot in the source path ensures hidden files are copied
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

    # Ensure all files in /opt/${pkgname} have correct permissions
    chmod -R 755 "${pkgdir}/opt/${pkgname}"

    # Install desktop file
    install -Dm644 "${srcdir}/squashfs-root/EEZ Studio.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"

    # Install icon
    install -Dm644 "${srcdir}/squashfs-root/EEZ Studio.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png"

    # Create symlink for executable
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "/dev/stdin" "${pkgdir}/usr/bin/${pkgname%-appimage}" <<EOF
#!/bin/bash
export PYTHONPATH=/opt/${pkgname}
exec "/opt/${pkgname}/EEZ Studio" "$@"
EOF
}
