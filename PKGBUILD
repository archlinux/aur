# Maintainer: Quinton <quinton@qubar.dev>
pkgname=qubar-git
pkgver=r0.05a1e84
pkgrel=11
pkgdesc="Modern Hyprland desktop with native QuickShell/QML UI"
arch=('x86_64')
url="https://github.com/GeneticxCln/Qubar"
license=('MIT')
depends=(
    # Core Hyprland (Official Repos)
    'hyprland'
    'hyprpaper'
    'hyprlock'
    'hypridle'
    'xdg-desktop-portal-hyprland'
    'xdg-desktop-portal-gtk'
    'polkit-kde-agent'
    
    # QuickShell (Official/AUR)
    'qt6-declarative'
    'qt6-5compat'
    'quickshell-git' # AUR
    
    # System utilities (Official Repos)
    'brightnessctl'
    'gammastep'
    'pipewire'
    'wireplumber'
    'libnotify'
    'grim'
    'slurp'
    'swappy'
    'jq'
    
    # System utilities (AUR)
    'wlogout'        # AUR
    'wallust'        # AUR
    
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
    'sddm-git: Display manager (Recommended for graphical login)'
)

makedepends=('git')
provides=('qubar')
conflicts=('qubar')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=qubar-git.install

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "$srcdir/$pkgname" || return 1
    
    # Create installation directory
    install -dm755 "$pkgdir/usr/share/qubar"
    
    # Copy core components
    cp -r backend topbar panel launcher overview theme modules assets \
          services hypr scripts install-scripts .config wallpapers \
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
    # Install all md files from docs/ if they exist, ignoring errors if directory is empty or missing
    if [ -d docs ]; then
        find docs -maxdepth 1 -type f -name "*.md" -exec install -Dm644 {} "$pkgdir/usr/share/doc/qubar/" \;
    fi
    install -m644 README.md PROJECT_STRUCTURE.md "$pkgdir/usr/share/doc/qubar/"
    
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Installation scripts (explicitly executable)
    install -Dm755 install.sh "$pkgdir/usr/share/qubar/install.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/share/qubar/uninstall.sh"
    install -Dm755 first-run-setup.sh "$pkgdir/usr/share/qubar/first-run-setup.sh"
    
    # Create symlinks for easy access
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/share/qubar/install.sh "$pkgdir/usr/bin/qubar-install"
    ln -s /usr/share/qubar/uninstall.sh "$pkgdir/usr/bin/qubar-uninstall"
    
    # Autostart entry - deploys configs on first login automatically
    install -Dm644 qubar-setup.desktop "$pkgdir/etc/xdg/autostart/qubar-setup.desktop"
}

