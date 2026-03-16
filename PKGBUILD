# Maintainer: multyfora <your@email.com>
pkgname=let-me-animate
pkgver=1.0.6
pkgrel=1
pkgdesc="Browse and run Wallpaper Engine wallpapers on Linux"
arch=('x86_64')
url="https://github.com/multyfora/let-me-animate"
license=('MIT')

# ── Runtime dependencies ──────────────────────────────────────────────────────
# steamcmd      — needed to download Workshop wallpapers
# linux-wallpaperengine — needed to run wallpapers
depends=(
    'steamcmd'
    'linux-wallpaperengine'
)

# No build step needed — we ship a pre-built app image
options=('!strip')

# ── Source ────────────────────────────────────────────────────────────────────
# Replace the URL with your actual GitHub release URL after publishing
source=("let-me-animate-1.0.6.tar.gz::https://github.com/multyfora/let-me-animate/releases/latest/download/LetMeAnimate-linux.tar.gz")
sha256sums=('d733f41b150c0d29ae30c2ca0dcfb492f5cc391cc0fa31b05b3d22c08122ae9b')

package() {
    # Install the app to /opt
    install -dm755 "${pkgdir}/opt/LetMeAnimate"
    cp -r "${srcdir}/LetMeAnimate/"* "${pkgdir}/opt/LetMeAnimate/"
    chmod +x "${pkgdir}/opt/LetMeAnimate/bin/LetMeAnimate"

    # Symlink binary to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/LetMeAnimate/bin/LetMeAnimate" "${pkgdir}/usr/bin/let-me-animate"

    # Desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/let-me-animate.desktop" <<EOF
[Desktop Entry]
Name=Let Me Animate
GenericName=Wallpaper Manager
Comment=Browse and run Wallpaper Engine wallpapers on Linux
Exec=/opt/LetMeAnimate/bin/LetMeAnimate
Icon=/opt/LetMeAnimate/lib/LetMeAnimate.png
Terminal=false
Type=Application
Categories=Utility;Graphics;
Keywords=wallpaper;steam;anime;
StartupWMClass=LetMeAnimate
EOF

    # Icon
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/LetMeAnimate/lib/LetMeAnimate.png" \
                  "${pkgdir}/usr/share/pixmaps/let-me-animate.png"
}
