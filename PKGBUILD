# Maintainer: p741633 <p741633@hotmail.com>

pkgname=sonictree-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Folder-based music player (AppImage binary)"
provides=('sonictree')
conflicts=('sonictree')
arch=('x86_64')
url="https://sourceforge.net/projects/sonictree/"
license=('LicenseRef-SonicTree-EULA')
depends=(
    bash
)
options=(!strip)

source=(
    "SonicTree-${pkgver}-${CARCH}.AppImage::https://downloads.sourceforge.net/project/sonictree/${pkgver}/SonicTree-${pkgver}-${CARCH}.AppImage"
    "LICENSE::https://downloads.sourceforge.net/sonictree/${pkgver}/LICENSE"
)

sha256sums=('fa4e0d7bb2e4155594b28c8309cfe191b749859b1bd1dda97691a4d12f3b5530'
            'b28fa60a2cd23ce36dae9f514e03f4d1d380a0442cea4eeff665ed4e4bf89fc7'
)

prepare() {
    chmod +x "${srcdir}/SonicTree-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/SonicTree-${pkgver}-${CARCH}.AppImage" --appimage-extract >/dev/null
}

package() {
    install -Dm644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 \
        "${srcdir}/SonicTree-${pkgver}-${CARCH}.AppImage" \
        "${pkgdir}/opt/${pkgname}/SonicTree.AppImage"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/sonictree" <<EOF
#!/bin/sh
exec /opt/${pkgname}/SonicTree.AppImage "\$@"
EOF

    if compgen -G "${srcdir}/squashfs-root/*.desktop" > /dev/null; then
        desktop=$(echo "${srcdir}"/squashfs-root/*.desktop)

        install -Dm644 \
            "$desktop" \
            "${pkgdir}/usr/share/applications/sonictree.desktop"

        sed -i \
            -e 's|^Exec=.*|Exec=sonictree|' \
            -e 's|^Icon=.*|Icon=sonictree|' \
            "${pkgdir}/usr/share/applications/sonictree.desktop"
    fi

    icon=$(find "${srcdir}/squashfs-root" -type f -name '*.png' | head -n1)

    if [[ -n "$icon" ]]; then
        install -Dm644 \
            "$icon" \
            "${pkgdir}/usr/share/pixmaps/sonictree.png"
    fi
}
