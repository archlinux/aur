pkgname=iopenpod
pkgver=1.0.40
pkgrel=2
pkgdesc="Open source iPod sync tool - manage your iPod without iTunes"
arch=('any')
url="https://github.com/TheRealSavi/iOpenPod"
license=('MIT')
depends=(
    python
    python-mutagen
)
makedepends=(uv)
optdepends=(
    'ffmpeg: for transcoding support'
    'chromaprint: for acoustic fingerprinting'
)
source=("https://github.com/TheRealSavi/iOpenPod/archive/refs/tags/v${pkgver}.tar.gz")
source+=("disable-autoupdater.patch")
sha256sums=(
    532cc208aaae5768aa5e6f024aaede018692ffef038fd73174e0eed1e96c9626
    SKIP
)

prepare() {
    cd "${srcdir}/iOpenPod-${pkgver}"
    patch -Np1 -i "${srcdir}/disable-autoupdater.patch"
}

package() {
    cd "${srcdir}/iOpenPod-${pkgver}"
    uv build
    uv pip install --prefix "${pkgdir}/usr" --no-deps dist/*.whl

    # Hatch wheel currently omits top-level runtime modules used by the
    # generated console entrypoint (`from main import main`).
    local site_pkgs
    site_pkgs=$(echo "${pkgdir}"/usr/lib/python*/site-packages)
    for f in main.py settings.py device_info.py ipod_iokit_query.py ipod_models.py ipod_usb_query.py sysinfo_authority.py; do
        install -Dm644 "$f" "${site_pkgs}/$f"
    done
    cp -a ipod_device "${site_pkgs}/"

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