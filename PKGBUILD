# Maintainer: multyfora <your@email.com>
pkgname=let-me-animate
pkgver=1.0.5
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
source=("let-me-animate-1.0.5.tar.gz::https://github.com/multyfora/let-me-animate/releases/download/v1.0.5/LetMeAnimate-1.0.5-linux.tar.gz")
sha256sums=('44c2d1dde3ecdba3cf1e8e4a17f00e79d1ad6152148159120a2eca51bb143d12')

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
