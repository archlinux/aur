# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=woven-shell-git
pkgver=1.4.0
pkgrel=1
pkgdesc="Complete Wayland shell for Sway — bar, launcher, lock, wallpaper, power menu, control center, config manager, OSD, screenshot, workspace switcher, and session daemon"
arch=('x86_64')
url="https://github.com/viewerofall/woven-shell"
license=('MIT')
depends=('sway' 'wireplumber' 'brightnessctl' 'playerctl' 'swaync' 'pam' 'slurp' 'grim')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/viewerofall/woven-shell.git")
sha256sums=('SKIP')

build() {
    cd woven-shell
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CFLAGS="${CFLAGS/-flto/}"
    cargo build --release --all-features 2>&1
}

package() {
    cd woven-shell

    # Install all binaries
    local bins=(woven-bar woven-power woven-cc woven-launch woven-lock woven-wall woven-pick woven-cfg woven-osd woven-screenshot woven-session woven-switch)
    for bin in "${bins[@]}"; do
        [ -f "target/release/$bin" ] && install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    done

    # Install default configs
    if [ -d "config" ]; then
        install -d "$pkgdir/usr/share/woven-shell/config"
        cp config/*.toml "$pkgdir/usr/share/woven-shell/config/" 2>/dev/null || true
        
        if [ -d "config/themes" ]; then
            install -d "$pkgdir/usr/share/woven-shell/config/themes"
            cp config/themes/*.toml "$pkgdir/usr/share/woven-shell/config/themes/" 2>/dev/null || true
        fi
    fi

    # Install systemd service
    [ -f "woven-session.service" ] && install -Dm644 "woven-session.service" "$pkgdir/usr/lib/systemd/user/woven-session.service"

    # Install desktop entry and icon
    [ -f "woven-shell-cfg.png" ] && install -Dm644 "woven-shell-cfg.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/woven-shell-cfg.png"
    
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/woven-cfg.desktop" <<EOF
[Desktop Entry]
Name=Woven Shell Config
Comment=Configure Woven Shell components
Exec=/usr/bin/woven-cfg
Icon=woven-shell-cfg
Type=Application
Categories=Settings;
Terminal=false
EOF
}
