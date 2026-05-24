pkgname=iopenpod
pkgver=1.0.53
pkgrel=1
pkgdesc="Open source iPod sync tool - manage your iPod without iTunes"
arch=('x86_64' 'aarch64')
url="https://github.com/TheRealSavi/iOpenPod"
license=('MIT')
depends=(
    hicolor-icon-theme
)
makedepends=(uv)
optdepends=(
    'ffmpeg: for transcoding support'
    'chromaprint: for acoustic fingerprinting'
)
source=("https://github.com/TheRealSavi/iOpenPod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(
    90fe46a66cfdd3d0b9c47f3997f8b2cb1ef264476e314e665b438c0406914588
)

build() {
    cd "${srcdir}/iOpenPod-${pkgver}"
    uv run --group dev pyinstaller --noconfirm iOpenPod.spec
}

package() {
    cd "${srcdir}/iOpenPod-${pkgver}"
    install -d "${pkgdir}/usr/lib/iopenpod"
    cp -a dist/iOpenPod/. "${pkgdir}/usr/lib/iopenpod/"

    install -d "${pkgdir}/usr/bin"
    ln -s ../lib/iopenpod/iOpenPod "${pkgdir}/usr/bin/iopenpod"

    install -Dm644 "assets/icons/icon-256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/iopenpod.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/iopenpod.desktop" << 'EOF'
[Desktop Entry]
Name=iOpenPod
Comment=Open source iPod sync tool
Exec=iopenpod
Icon=iopenpod
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Utility;
EOF
}
