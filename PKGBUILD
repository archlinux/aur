# Maintainer: p741633 <p741633@hotmail.com>

pkgname=sonictree-bin
pkgver=1.3.0
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

sha256sums=('d1790441aecfba3784a7545fc67a16088bc00ff7e2f1c24d521f012977f3b0cd'
            '7bbf82020c64143dc28a86ef0c7ba1182305a4a04fc07e081f077d92cf703558'
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
