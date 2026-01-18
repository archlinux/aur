# Maintainer: DonutsDelivery <donutsdelivery@users.noreply.github.com>
pkgname=localbooru-donut
pkgver=0.2.1
pkgrel=1
pkgdesc="Local image library with automatic AI tagging"
arch=('x86_64')
url="https://github.com/DonutsDelivery/LocalBooru"
license=('MIT')
depends=(
    'electron'
    'python'
    'python-pip'
    'python-fastapi'
    'python-uvicorn'
    'python-sqlalchemy'
    'python-aiosqlite'
    'python-pillow'
    'python-pydantic'
    'python-httpx'
    'python-watchdog'
    'python-numpy'
    'python-opencv'
)
makedepends=(
    'npm'
    'nodejs'
)
optdepends=(
    'python-pytorch: For AI tagging and age detection'
    'python-transformers: For AI models'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "LocalBooru-${pkgver}"

    # Build frontend
    cd frontend
    npm ci
    npm run build
    cd ..
}

package() {
    cd "LocalBooru-${pkgver}"

    # Install application files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r electron "${pkgdir}/opt/${pkgname}/"
    cp -r frontend/dist "${pkgdir}/opt/${pkgname}/frontend/"
    cp -r api "${pkgdir}/opt/${pkgname}/"
    cp -r assets "${pkgdir}/opt/${pkgname}/"
    cp package.json "${pkgdir}/opt/${pkgname}/"

    # Create tagger directory (models downloaded on first use)
    install -dm755 "${pkgdir}/opt/${pkgname}/tagger"

    # Install launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
exec electron /opt/localbooru-donut "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=LocalBooru
Comment=Local image library with automatic AI tagging
Exec=${pkgname}
Icon=${pkgname}
Type=Application
Categories=Graphics;Photography;
StartupWMClass=LocalBooru
EOF

    # Install icon
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
