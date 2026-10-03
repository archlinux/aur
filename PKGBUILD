# Maintainer: eDEX-OS <edex-de@github.com>
pkgname=edex-de
pkgver=3.3.1
pkgrel=1
pkgdesc="eDEX-DE — sci-fi desktop shell for Hyprland (Rust + wgpu), with greetd greeter"
arch=('x86_64')
url="https://github.com/eDEX-OS/eDEX-DE"
license=('GPL-3.0-only')
depends=(
    'hyprland>=0.55'
    'cage'
    'greetd'
    'greetd-tuigreet'
    'libxkbcommon'
    'wayland'
    'vulkan-icd-loader'
    'dbus'
    'polkit'
    'hyprpolkitagent'
    'hyprlock'
    'hypridle'
    'hyprsunset'
    'qt6ct'
    'papirus-icon-theme'
    'adw-gtk-theme'
    'xdg-desktop-portal-hyprland'
    'xdg-desktop-portal-gtk'
    'pipewire'
    'wireplumber'
    'networkmanager'
    'bluez-utils'
    'upower'
    'brightnessctl'
    'ttf-jetbrains-mono-nerd'
    'kitty'
    'ranger'
    'wl-clipboard'
    'cliphist'
    'grim'
    'slurp'
    'playerctl'
    'libnotify'
)
makedepends=('rust' 'cargo' 'git' 'librsvg' 'pkgconf' 'vulkan-headers')
optdepends=(
    'tailscale: Tailscale controls in the privacy panel'
    'tor: Tor modes in the privacy panel'
    'lyrebird: obfs4 bridges'
    'snowflake-pt-client: Snowflake bridges'
    'fprintd: fingerprint enrolment and login'
    'power-profiles-daemon: power profiles'
    'accountsservice: user account editing'
    'pavucontrol: advanced audio mixer'
    'nemo: file manager for SUPER+E'
)
install=edex-de.install
backup=('etc/edex-greeter/greeter.toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eDEX-OS/eDEX-DE/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d624ec9d598ea0cc82ac268b9420ddbc5e05ecedfe82b1a791393e67271a0b05')

build() {
    cd "eDEX-DE-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --locked --workspace --bins
    assets/make-assets.sh assets/generated
}

check() {
    cd "eDEX-DE-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --release --locked --workspace
}

package() {
    cd "eDEX-DE-${pkgver}"
    install -Dm755 target/release/edex-de "$pkgdir/usr/bin/edex-de"
    install -Dm755 target/release/edex-greeter "$pkgdir/usr/bin/edex-greeter"
    install -Dm755 packaging/session/edex-session "$pkgdir/usr/bin/edex-session"
    install -Dm755 packaging/greetd/edex-greeter-session "$pkgdir/usr/bin/edex-greeter-session"
    install -Dm644 packaging/session/edex-de.desktop "$pkgdir/usr/share/wayland-sessions/edex-de.desktop"
    install -Dm644 -t "$pkgdir/usr/share/applications" packaging/applications/*.desktop
    install -Dm644 packaging/session/edex-de-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/edex-de-portals.conf"
    install -Dm644 packaging/systemd/edex-de.service "$pkgdir/usr/lib/systemd/user/edex-de.service"
    install -Dm644 packaging/tmpfiles/edex-greeter.conf "$pkgdir/usr/lib/tmpfiles.d/edex-greeter.conf"
    install -Dm644 packaging/polkit/50-edex-greeter-power.rules "$pkgdir/usr/share/polkit-1/rules.d/50-edex-greeter-power.rules"
    install -Dm644 packaging/greeter/greeter.toml "$pkgdir/etc/edex-greeter/greeter.toml"
    install -Dm644 packaging/greetd/config.toml "$pkgdir/usr/share/edex-de/greetd/config.toml"
    install -Dm644 share/skel/hyprland.lua "$pkgdir/etc/skel/.config/hypr/hyprland.lua"
    install -dm755 "$pkgdir/usr/share/edex-de/themes" "$pkgdir/usr/share/edex-de/hypr" \
        "$pkgdir/usr/share/edex-de/backgrounds" "$pkgdir/usr/share/edex-de/skel"
    install -m644 themes/*.toml "$pkgdir/usr/share/edex-de/themes/"
    cp -r share/hypr/. "$pkgdir/usr/share/edex-de/hypr/"
    install -m644 share/skel/hyprland.lua "$pkgdir/usr/share/edex-de/skel/hyprland.lua"
    install -m644 assets/generated/backgrounds/*.png "$pkgdir/usr/share/edex-de/backgrounds/"
    for s in 32 48 64 128 256 512; do
        install -Dm644 "assets/generated/icons/edex-de-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/edex-de.png"
    done
    install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/edex-de.svg"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/architecture.md "$pkgdir/usr/share/doc/$pkgname/architecture.md"
    install -Dm644 docs/ipc.md "$pkgdir/usr/share/doc/$pkgname/ipc.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
