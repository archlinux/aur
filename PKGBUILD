# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>

pkgname=eez-studio-appimage
pkgver=0.24.0
pkgrel=1
pkgdesc="Cross-platform low-code GUI and automation"
arch=('x86_64' 'aarch64')
url="https://github.com/eez-open/studio/releases"
license=('GPL')
options=(!strip)

depends=(
    'python'
)

makedepends=(
    'python-pip'
    'python-setuptools'
)

source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/eez-open/studio/releases/download/v${pkgver}/EEZ-Studio-${pkgver}.AppImage"
    "requirements.txt"
)

sha256sums=('541b115c009b418e5a8599b490a57ddfbc6c2631456c34684c4fc62f93cafe11'
            '7019be3da97f345557fb38a581aabfd8a1d2e5324391a785213d8e5eb238aa90')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    cd "${srcdir}"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

build() {
    sed -i "s|Exec=AppRun|Exec=${pkgname%-appimage}|" "${srcdir}/squashfs-root/eezstudio.desktop"
    pip install --target="${srcdir}/pydeps" -r "${srcdir}/requirements.txt"
}

package() {
    # Create the application directory
    mkdir -p "${pkgdir}/opt/${pkgname}"

    # Copy extracted AppImage contents to /opt/${pkgname}
    # The trailing dot in the source path ensures hidden files are copied
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

    # Copy Python dependencies to /opt/${pkgname}
    cp -a "${srcdir}/pydeps/"* "${pkgdir}/opt/${pkgname}/"

    # Ensure all files in /opt/${pkgname} have correct permissions
    chmod -R 755 "${pkgdir}/opt/${pkgname}"

    # Install desktop file
    install -Dm644 "${srcdir}/squashfs-root/eezstudio.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"

    # Install icon
    install -Dm644 "${srcdir}/squashfs-root/eezstudio.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png"

    # Create symlink for executable
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "/dev/stdin" "${pkgdir}/usr/bin/${pkgname%-appimage}" <<EOF
#!/bin/bash
export PYTHONPATH=/opt/${pkgname}
exec "/opt/${pkgname}/eezstudio" "$@"
EOF
}
