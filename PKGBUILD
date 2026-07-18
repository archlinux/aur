# Maintainer: Steve Holvoet <linux@steho.be>

pkgname=romhex14-community
pkgver=1.0.0.beta8
pkgrel=1
_github_tag="romhex14-community1.0.0-beta8"
pkgdesc="Professional ECU Calibration Hex Editor — open-source cross-platform automotive tuning tool"
arch=('x86_64')
url="https://github.com/ctabuyo/romHEX14-community"
license=('GPL3')
depends=(
    'qt6-base'
    'zlib'
)
makedepends=(
    'cmake'
    'qt6-tools'
)
source=("git+https://github.com/ctabuyo/romHEX14-community.git#tag=${_github_tag}")
sha256sums=('SKIP')
_srcdir="romHEX14-community"

build() {
    cd "${srcdir}/${_srcdir}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRX14_PRO_BUILD=OFF \
        -DRX14_DEBUG_RPC=OFF
    cmake --build build --parallel "$(nproc)"
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/rx14 "${pkgdir}/usr/bin/rx14"

    install -Dm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/rx14.png"
    for size in 16 32 48 64 128; do
        if [ -f "resources/icon.iconset/icon_${size}x${size}.png" ]; then
            install -Dm644 "resources/icon.iconset/icon_${size}x${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/rx14.png"
        fi
    done

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/rx14.desktop" << EOF
[Desktop Entry]
Name=romHEX 14 Community
Comment=Professional ECU Calibration Hex Editor
Exec=rx14
Icon=rx14
Type=Application
Categories=Development;Engineering;
Terminal=false
StartupNotify=true
EOF
}
