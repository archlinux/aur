# Maintainer: Quinton <quinton@qubar.dev>
pkgname=qubar-git
pkgver=1.0.0.r0.d90653a
pkgrel=1
pkgdesc="Modern Hyprland desktop environment with 100% native QuickShell/QML UI"
arch=('x86_64')
url="https://github.com/GeneticxCln/Qubar"
license=('MIT')
depends=(
    # Core Hyprland
    'hyprland'
    'hyprpaper'
    'hyprlock'
    'hypridle'
    'xdg-desktop-portal-hyprland'
    'xdg-desktop-portal-gtk'
    'polkit-kde-agent'
    
    # QuickShell
    'qt6-declarative'
    'qt6-5compat'
    'quickshell-git'
    
    # System utilities
    'brightnessctl'
    'gammastep'
    'wlogout'
    'wallust'
    'pipewire'
    'wireplumber'
    'libnotify'
    'grim'
    'slurp'
    'swappy'
    'jq'
    
    # Applications
    'kitty'
    'thunar'
    'thunar-archive-plugin'
    'firefox'
    'cava'
    
    # Fonts
    'ttf-jetbrains-mono-nerd'
    'ttf-victor-mono'
    'ttf-firacode-nerd'
    'ttf-opensans'
    'ttf-font-awesome'
    'noto-fonts'
    'noto-fonts-emoji'
    
    # ZSH
    'zsh'
    'zsh-completions'
    'zsh-autosuggestions'
    'zsh-syntax-highlighting'
    'eza'
    'bat'
    'fastfetch'
)

optdepends=(
    'pamixer: Volume control'
    'playerctl: Media control'
    'wl-clipboard: Clipboard utilities'
    'cliphist: Clipboard history'
    'swww: Alternative wallpaper daemon'
    'swaylock: Alternative lock screen'
    'gamemode: Gaming optimizations'
    'kvantum: Qt theme engine'
    'qt5ct: Qt5 configuration'
    'qt6ct: Qt6 configuration'
    'sddm: Display manager'
    'sddm-git: Display manager (git version)'
)

makedepends=('git')
provides=('qubar')
conflicts=('qubar')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    
    # Create installation directory
    install -dm755 "$pkgdir/usr/share/qubar"
    
    # Copy all files
    cp -r backend "$pkgdir/usr/share/qubar/"
    cp -r topbar "$pkgdir/usr/share/qubar/"
    cp -r panel "$pkgdir/usr/share/qubar/"
    cp -r launcher "$pkgdir/usr/share/qubar/"
    cp -r overview "$pkgdir/usr/share/qubar/"
    cp -r theme "$pkgdir/usr/share/qubar/"
    cp -r modules "$pkgdir/usr/share/qubar/"
    cp -r services "$pkgdir/usr/share/qubar/"
    cp -r hypr "$pkgdir/usr/share/qubar/"
    cp -r scripts "$pkgdir/usr/share/qubar/"
    cp -r install-scripts "$pkgdir/usr/share/qubar/"
    cp -r .config "$pkgdir/usr/share/qubar/"
    cp shell.qml "$pkgdir/usr/share/qubar/"
    cp GlobalStates.qml "$pkgdir/usr/share/qubar/"
    cp config.json "$pkgdir/usr/share/qubar/"
    
    # Documentation
    install -dm755 "$pkgdir/usr/share/doc/qubar"
    cp -r docs/* "$pkgdir/usr/share/doc/qubar/" 2>/dev/null || true
    cp README.md "$pkgdir/usr/share/doc/qubar/"
    cp UI_ARCHITECTURE.md "$pkgdir/usr/share/doc/qubar/"
    cp PROJECT_SUMMARY.md "$pkgdir/usr/share/doc/qubar/"
    
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Installation script
    install -Dm755 install.sh "$pkgdir/usr/share/qubar/install.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/share/qubar/uninstall.sh"
    
    # Create symlink for easy access
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/qubar-install" << 'EOF'
#!/bin/bash
/usr/share/qubar/install.sh "$@"
EOF
    chmod +x "$pkgdir/usr/bin/qubar-install"
    
    # Post-install message
    cat > "$pkgdir/usr/share/qubar/PKGBUILD_NOTES" << 'EOF'
Qubar Desktop Environment has been installed to /usr/share/qubar

To complete installation, run:
    qubar-install

This will:
- Deploy configurations to ~/.config
- Set up ZSH with themes
- Configure Hyprland
- Optionally set up SDDM

For documentation, see:
    /usr/share/doc/qubar/

To uninstall:
    /usr/share/qubar/uninstall.sh
EOF
}
