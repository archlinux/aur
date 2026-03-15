# Maintainer: multyfora <your@email.com>
pkgname=let-me-animate
pkgver=1.0.4
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
source=("https://github.com/multyfora/let-me-animate/releases/download/1.0.4-early-alpha/LetMeAnimate-1.0.4-linux.tar.gz")
sha256sums=('1409a5c0fcb8034344cec5787cc6eb7a523239176aefc5a55e382aea023c0166') # Replace SKIP with actual sha256 after building: sha256sum LetMeAnimate-1.0-linux.tar.gz

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
