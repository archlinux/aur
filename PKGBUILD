# Maintainer: Tenchirox <tenchirox@github.com>
pkgname=all4laser-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Open-source laser engraver controller built with Rust and egui (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Tenchirox/All4Laser"
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'libxcb'
    'libxkbcommon'
    'libglvnd'
    'mesa'
    'fontconfig'
    'freetype2'
    'systemd-libs'
    'v4l-utils'
    'gtk3'
    'openssl'
)
provides=("all4laser=${pkgver}")
conflicts=('all4laser' 'all4laser-git')
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::https://github.com/Tenchirox/All4Laser/releases/download/v${pkgver}/all4laser_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::https://github.com/Tenchirox/All4Laser/releases/download/v${pkgver}/all4laser_${pkgver}_arm64.deb")
sha256sums_x86_64=('d8485185b08cf90433cf66f86d8ba93e2a2a72a250d5005d1bc72bdef35ed6e8')
sha256sums_aarch64=('1dab65dc018f29d332b2d0e16705eb26fd6b2dcba13d42084e16b8a87baa73b7')

package() {
    cd "${srcdir}"

    # Extract data from the .deb
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/all4laser"

    # Fix .desktop file (packager generates empty Categories)
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/all4laser.desktop" << 'EOF'
[Desktop Entry]
Name=All4Laser
Comment=Open-source laser engraver controller
Exec=all4laser
Icon=all4laser
Terminal=false
Type=Application
Categories=Graphics;Engineering;
Keywords=laser;engraver;gcode;cnc;grbl;
EOF

    # Install license from upstream repo
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
This software is licensed under the GNU General Public License v3.0.
See https://github.com/Tenchirox/All4Laser/blob/main/LICENSE for the full text.
EOF
}
