# Maintainer: xtexecute <none@none>

pkgname=fleshfetch
pkgver=1.3.2
pkgrel=1
pkgdesc="Very early development clicker game based on GTK4, written in Python with modding support. This is a complete joke, if you couldn't tell."
arch=('any')
url="https://github.com/xtexecute/fleshfetch"
license=('MIT')

depends=(
    'python'
    'python-gobject'
    'gtk4'
    'python-requests'
    'python-pygame'
)

optdepends=(
    'python-pypresence: Discord Rich Presence support'
    'libpulse: paplay fallback sound playback'
    'alsa-utils: aplay fallback sound playback'
)

makedepends=('git')

source=(
    "$pkgname::git+https://github.com/xtexecute/fleshfetch.git#branch=main"
)

sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    # Main app modules
    install -d "$pkgdir/usr/share/fleshfetch"
    install -m644 \
        bootstrap.py \
        console_capture.py \
        defaults.py \
        fleshfetch.py \
        leaderboard.py \
        main.py \
        mod_api.py \
        paths.py \
        rpc.py \
        save_manager.py \
        security.py \
        ui.py \
        "$pkgdir/usr/share/fleshfetch/"

    # System-wide mods folder
    install -d "$pkgdir/usr/share/fleshfetch/mods"

    # Launcher
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/fleshfetch" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/share/fleshfetch/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/fleshfetch"

    # Assets
    install -d "$pkgdir/usr/share/fleshfetch/assets"
    install -m644 flesh.png click.wav "$pkgdir/usr/share/fleshfetch/assets/"

    # App icon
    install -Dm644 flesh.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.xtexecute.fleshfetch.png"

    # Desktop entry
    install -Dm644 dev.xtexecute.fleshfetch.desktop \
        "$pkgdir/usr/share/applications/dev.xtexecute.fleshfetch.desktop"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
