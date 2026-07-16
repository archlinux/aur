# Maintainer: DonutsDelivery <donutsdelivery@users.noreply.github.com>
# The historical package name is retained so existing AUR users upgrade in place.
pkgname=localbooru-donut
pkgver=2.0.0
pkgrel=1
pkgdesc="Private local image and video library with optional AI tagging"
arch=('x86_64')
url="https://github.com/DonutsDelivery/LocalBooru"
license=('MIT')
depends=('fuse2' 'zlib')
options=('!strip')
source=(
    "localbooru-icon-${pkgver}.png::https://raw.githubusercontent.com/DonutsDelivery/LocalBooru/v${pkgver}/assets/icon.png"
    "localbooru-license-${pkgver}::https://raw.githubusercontent.com/DonutsDelivery/LocalBooru/v${pkgver}/LICENSE"
)
source_x86_64=(
    "LocalBooru-Linux-${pkgver}.AppImage::https://github.com/DonutsDelivery/LocalBooru/releases/download/v${pkgver}/LocalBooru-Linux.AppImage"
)
sha256sums=(
    '1c21d4fc5e5dbf6df38e739d8284e048e0d6be83dc9973c882b6eb69d92fb341'
    '3306b10d23af40e7666e965b0f0a4ea95b4528ade79ecccee0a3b68e583ab21d'
)
sha256sums_x86_64=(
    '6bee3a7e9a0d418b6a58159de49604fc7b53520ef4bc8f35e8caf840a4509c21'
)

package() {
    install -Dm755 "LocalBooru-Linux-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/LocalBooru.AppImage"
    install -Dm644 "localbooru-icon-${pkgver}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "localbooru-license-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/bin"
    printf '%s\n' \
        '#!/bin/sh' \
        'exec /opt/localbooru-donut/LocalBooru.AppImage "$@"' \
        > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications"
    printf '%s\n' \
        '[Desktop Entry]' \
        'Name=LocalBooru' \
        'Comment=Private local image and video library' \
        'Exec=localbooru-donut %f' \
        'TryExec=localbooru-donut' \
        'Icon=localbooru-donut' \
        'Terminal=false' \
        'Type=Application' \
        'Categories=Graphics;Photography;' \
        'StartupWMClass=LocalBooru' \
        'MimeType=image/jpeg;image/png;image/gif;image/webp;video/mp4;video/x-matroska;video/webm;video/quicktime;' \
        > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}