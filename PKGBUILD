# Maintainer: Firstp1ck <al.leuzi@hotmail.com>
# Contributor: Firstp1ck <al.leuzi@hotmail.com>
pkgname="hyprland-simple-setup-git"
pkgver=0.5.0.r2.g2b27612
pkgrel=3
pkgdesc="Setup Hyprland the simple way (TUI)."
arch=('x86_64')
url="https://github.com/Firstp1ck/Hyprland-Simple-Setup.git"
license=('GPL-3.0-or-later')
provides=('hyprland-simple-setup')
conflicts=('hyprland-simple-setup')
makedepends=('git' 'rust')
depends=('bash'
'sudo'
'xdg-user-dirs')
source=("$pkgname::git+https://github.com/Firstp1ck/Hyprland-Simple-Setup.git")
sha256sums=('SKIP')

pkgver() {
    : "${srcdir:?srcdir is not set}"
    cd "$srcdir/$pkgname" || exit 1

    if git describe --tags --abbrev=0 >/dev/null 2>&1; then
      git describe --tags --long --always \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
      printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    : "${srcdir:?srcdir is not set}"
    cd "$srcdir/$pkgname" || exit 1
    # Some environments may nest the project; ensure we're at the Cargo root
    if [ ! -f Cargo.toml ] && [ -d Hyprland-Simple-Setup ]; then
        cd Hyprland-Simple-Setup || exit 1
    fi
    cargo build --release --locked
}

package() {
    : "${pkgdir:?pkgdir is not set}"
    : "${srcdir:?srcdir is not set}"
    cd "$srcdir/$pkgname" || exit 1
    # Ensure we operate from the project root where Cargo.toml resides
    if [ ! -f Cargo.toml ] && [ -d Hyprland-Simple-Setup ]; then
        cd Hyprland-Simple-Setup || exit 1
    fi

    # Shared assets (used by the TUI and installer)
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -a dotfiles "$pkgdir/usr/share/$pkgname/"
    cp -a Wallpaper "$pkgdir/usr/share/$pkgname/"
    cp -a system_files "$pkgdir/usr/share/$pkgname/"
    cp -a packages.json "$pkgdir/usr/share/$pkgname/"
    install -Dm755 setup.sh "$pkgdir/usr/share/$pkgname/setup.sh"

    # Install compiled binary
    install -Dm755 "target/release/hyprland_setup_tui" "$pkgdir/usr/bin/hyprland_setup_tui"

    # Launcher that sets HYPR_SETUP_PATH, cds into shared assets (for packages.json), and calls the TUI
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/hyprland-simple-setup" << 'EOF'
#!/bin/bash
share="/usr/share/hyprland-simple-setup-git"
export HYPR_SETUP_PATH="$share/setup.sh"
cd "$share" 2>/dev/null || true
exec /usr/bin/hyprland_setup_tui "$@"
EOF

    # Compatibility symlink
    ln -s "/usr/bin/hyprland-simple-setup" "$pkgdir/usr/bin/hyprland-simple-setup-git"
}

post_install() {
    echo "==> Run 'hyprland-simple-setup' to start the Hyprland setup."
}
