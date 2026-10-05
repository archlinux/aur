# Maintainer: everyoneexe <everyoneexe@users.noreply.github.com>
pkgname=quickshell-greetd
pkgver=2.1.0
pkgrel=1
pkgdesc="Theme-agnostic greetd greeter built on Quickshell; runs an existing Quickshell lockscreen as the login screen"
arch=('any')
url="https://github.com/everyoneexe/quickshell-greetd"
license=('MIT')
# cage is the default greeter compositor; python runs qsgreet-theme-prepare.
# seatd is only needed without logind, which already provides seats on a
# systemd system.
depends=('quickshell' 'greetd' 'cage' 'python')
optdepends=(
    'seatd: seat management without logind'
    'niri: layer-shell greeter compositor with multi-output support'
    'sway: layer-shell greeter compositor with multi-output support'
    'fprintd: fingerprint login, via pam_fprintd in /etc/pam.d/greetd'
    'gnome-keyring: keyring unlock at login, via pam_gnome_keyring'
)
backup=('etc/quickshell-greetd/config.env')
install="$pkgname.install"
makedepends=('git')
# A git tag, not GitHub's generated tarball. Those are not byte-stable -
# their checksum can change under you, and after a tag is moved the CDN
# serves a stale archive for a while. SKIP is the correct and expected
# value for a VCS source.
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$pkgname"

    local share="$pkgdir/usr/share/quickshell-greetd"

    # Core QML module and entry template.
    install -Dm644 core/entry.qml "$share/core/entry.qml"
    install -Dm644 core/QsGreet/qmldir "$share/core/QsGreet/qmldir"
    local file
    for file in core/QsGreet/*.qml; do
        install -Dm644 "$file" "$share/core/QsGreet/$(basename "$file")"
    done

    # Adapters injected into prepared themes, selected by --kind.
    install -Dm644 adapters/lockscreen/Main.qml "$share/adapters/lockscreen/Main.qml"
    install -Dm644 adapters/lockscreen/LockContext.qml "$share/adapters/lockscreen/LockContext.qml"
    install -Dm644 adapters/standalone/Main.qml "$share/adapters/standalone/Main.qml"

    install -Dm755 launcher/quickshell-greetd-launcher "$pkgdir/usr/bin/quickshell-greetd-launcher"
    install -Dm755 tools/qsgreet-theme-prepare "$pkgdir/usr/bin/qsgreet-theme-prepare"
    install -Dm755 tools/qsgreet-set-avatar "$pkgdir/usr/bin/qsgreet-set-avatar"

    # Shared avatar store; see assets/tmpfiles.conf for why it is public.
    install -Dm644 assets/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 assets/pam.d/greetd.example "$pkgdir/usr/share/doc/$pkgname/pam.d-greetd.example"

    install -Dm644 docs/THEME_CONTRACT.md "$pkgdir/usr/share/doc/$pkgname/THEME_CONTRACT.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Default configuration. Everything is commented out: with no config the
    # greeter still starts and shows its built-in login.
    install -Dm644 /dev/stdin "$pkgdir/etc/quickshell-greetd/config.env" <<'EOF'
# quickshell-greetd configuration.
# Sourced by the launcher; the environment set by greetd always wins.

# Theme directory name under /usr/share/quickshell-greetd/themes.
# "fallback" uses the built-in login. Create a theme with:
#   qsgreet-theme-prepare ~/.config/quickshell/<shell> \
#       --surface modules/iris/lock/IrisLockSurface.qml \
#       /usr/share/quickshell-greetd/themes/<name>
#QSGREET_THEME=fallback

# Log straight in as this user and hide the user picker.
# Autodetected when the machine has exactly one regular account.
#QSGREET_USER=
#QSGREET_LOCK_USER=1

# Greeter compositor: cage (default), niri or sway.
# cage has no wlr-layer-shell, so the greeter uses a plain fullscreen window.
# niri and sway do, which gives one layer surface per output.
#QSGREET_COMPOSITOR=cage

# Seconds a theme gets to draw before the built-in login replaces it.
#QSGREET_THEME_WATCHDOG=6

# Session command used when no desktop file is selected, as a JSON array.
#QSGREET_DEFAULT_COMMAND=["niri-session"]

#QSGREET_POWER_ENABLED=1
EOF

    install -Dm644 /dev/stdin "$pkgdir/etc/greetd/config.toml.example" <<'EOF'
[terminal]
vt = 1

[default_session]
command = "/usr/bin/quickshell-greetd-launcher"
user = "greeter"
EOF
}
