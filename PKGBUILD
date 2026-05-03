# Maintainer: Jordan Sluiter <jordan.sluiter@icloud.com>
pkgname=shrimp
pkgver=0.1.3
pkgrel=1
pkgdesc="Self-hosted AI productivity assistant"
arch=('x86_64')
url="https://github.com/TheSingularis/shrimp"
license=('MIT')
depends=(
    'electron39'
    'python'
    'python-numpy'
    'python-pillow'
    'python-sqlalchemy'
    'python-networkx'
    'python-fastapi'
    'python-aiohttp'
    'python-pydantic'
    'python-httpx'
    'python-grpcio'
    'python-requests'
    'python-rich'
    'python-keyring'
)
conflicts=('shrimp-bin')
install=shrimp.install
source=("shrimp-${pkgver}.tar.gz::https://github.com/TheSingularis/shrimp/releases/download/v${pkgver}/shrimp-${pkgver}.tar.gz")
sha256sums=('bab37d5258b0b4aa100b6fe710d271329758fe7591081b3ba34b0ff4f610ecd3')

package() {
    cd "shrimp-${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/shrimp"
    cp -r electron frontend backend plugins package.json "${pkgdir}/usr/lib/shrimp/"
    chmod -R a+rX "${pkgdir}/usr/lib/shrimp/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/shrimp" <<'EOF'
#!/usr/bin/env sh
export SHRIMP_APP_PATH=/usr/lib/shrimp
exec /usr/bin/electron39 /usr/lib/shrimp/electron/main.js "$@"
EOF

    install -Dm644 "frontend/public/icons/shrimp(1).png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/shrimp.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shrimp.desktop" <<'EOF'
[Desktop Entry]
Name=SHRIMP
Comment=Self-hosted AI productivity assistant
Exec=/usr/bin/shrimp %U
Icon=shrimp
Type=Application
Categories=Utility;Office;
EOF
}
