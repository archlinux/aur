# Maintainer: Quinton <quinton@qubar.dev>
pkgname=qubar-git
pkgver=1.0.1.r0.b5eef0d
pkgrel=3
pkgdesc="Modern Hyprland desktop with native QuickShell/QML UI"
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
    
    # QuickShell (AUR)
    'qt6-declarative'
    'qt6-5compat'
    'quickshell-git' # AUR
    
    # System utilities
    'brightnessctl'
    'gammastep'
    'wlogout'        # AUR (or extra)
    'wallust'        # AUR
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
    'sddm-git: Display manager (git version recommended)'
)

makedepends=('git')
provides=('qubar')
conflicts=('qubar')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "1.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    
    # Create installation directory
    install -dm755 "$pkgdir/usr/share/qubar"
    
    # Copy core components
    cp -r backend topbar panel launcher overview theme modules \
          services hypr scripts install-scripts .config \
          shell.qml GlobalStates.qml config.json \
          "$pkgdir/usr/share/qubar/"

    # Cleanup .git artifacts if any copied over
    find "$pkgdir/usr/share/qubar" -name ".git*" -exec rm -rf {} +
    find "$pkgdir/usr/share/qubar" -name "__pycache__" -exec rm -rf {} +

    # Fix permissions (Standard Arch packaging practice)
    # Directories 755, Files 644 by default
    find "$pkgdir/usr/share/qubar" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/qubar" -type f -exec chmod 644 {} +

    # Restore executable permissions for scripts
    find "$pkgdir/usr/share/qubar" -name "*.sh" -exec chmod 755 {} +
    
    # Documentation
    install -dm755 "$pkgdir/usr/share/doc/qubar"
    cp -r docs/* "$pkgdir/usr/share/doc/qubar/" 2>/dev/null || true
    install -m644 README.md UI_ARCHITECTURE.md PROJECT_SUMMARY.md "$pkgdir/usr/share/doc/qubar/"
    
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Installation scripts (explicitly executable)
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
