# Maintainer: Jordan Sluiter <jordan.sluiter@icloud.com>
pkgname=shrimp
pkgver=0.1.1
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
)
conflicts=('shrimp-bin')
install=shrimp.install
source=("shrimp-${pkgver}.tar.gz::https://github.com/TheSingularis/shrimp/releases/download/v${pkgver}/shrimp-${pkgver}.tar.gz")
sha256sums=('a10a12132bc35386bc77fe58d46e46015f112eb2f4cda547fc30d51c34c37f25')

package() {
    cd "shrimp-${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/shrimp"
    cp -r electron frontend backend plugins package.json "${pkgdir}/usr/lib/shrimp/"

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
