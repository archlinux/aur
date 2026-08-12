# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=autoremesher
pkgname=$_pkgname-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform automatic quad remeshing tool"
arch=('x86_64')
url="https://github.com/huxingyi/autoremesher"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libgcc' 'libstdc++' 'zlib')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
options=('!strip')
source=(
	"$pkgname-$pkgver.AppImage::https://github.com/huxingyi/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.AppImage"
	"LICENSE-$pkgver::https://raw.githubusercontent.com/huxingyi/$_pkgname/refs/tags/$pkgver/LICENSE"
)
sha256sums=('835b5558ec71b44f0b040586534fcdfd334fab60043869fbbbd60e48c34f21e2'
            '1c334f5c8b5bf833d0be8c15566ac9180c12750b836d8e2fac88e9cb38c0e51e')

prepare() {
    chmod +x "${srcdir}/$pkgname-$pkgver.AppImage"
    "${srcdir}/$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
    install -Dm755 "${srcdir}/$pkgname-$pkgver.AppImage" "${pkgdir}/opt/$pkgname/$_pkgname.AppImage"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/$_pkgname" <<'EOF'
#!/usr/bin/env bash
exec /opt/autoremesher-bin/autoremesher.AppImage "$@"
EOF

    if [[ -f "${srcdir}/squashfs-root/$_pkgname.desktop" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    elif [[ -f "${srcdir}/squashfs-root/usr/share/applications/$_pkgname.desktop" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    else
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/$_pkgname.desktop" <<'EOF'
[Desktop Entry]
Name=AutoRemesher
Exec=autoremesher
Icon=autoremesher
Type=Application
Categories=Graphics;
Terminal=false
EOF
    fi

    if [[ -f "${srcdir}/squashfs-root/$_pkgname.png" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/$_pkgname.png" "${pkgdir}/usr/share/pixmaps/$_pkgname.png"
    elif [[ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/$_pkgname.png" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/$_pkgname.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    fi

    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/$_pkgname.appdata.xml" \
        "${pkgdir}/usr/share/metainfo/$_pkgname.appdata.xml" 2>/dev/null || true

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
