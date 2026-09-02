# Maintainer: PolJak <polesnik.jaka@gmail.com>

pkgname=polland-de-full
pkgver=1.0.0
pkgrel=1
pkgdesc="A desktop environment built on top of the shoulders of giants and the personality of some guy somewhere. Built on top of hyprland. Comes with all the bells and whistles."
arch=('x86_64' 'aarch64')
url="https://github.com/Pol-Jak-295/PolLand"
license=('AGPL')
epends=(
    # === CORE RICE ===
    'hyprland'
    'rofi'
    'waybar'
    'kitty'
    'awww'
    'swaync'
    'hyprlock'
    'nwg-bar'
    'sddm'
    'sddm-sugar-candy-git'
    'darkman'
    'playerctl'
    'brightnessctl'
    'wireplumber'
    'pipewire'
    'pipewire-pulse'
    'kexec-tools'
    
    # === AUDIO ENHANCEMENT ===
    'easyeffects'                 # Audio effects
    'lsp-lv2'                     # Audio plugins
    'x42-plugins-lv2'             # Audio plugins
    'zita-convolver'              # Audio plugins
    'calf'                        # Audio plugins
    'mda.lv2'                     # Audio plugins
    'libebur128'                  # Loudness metering
    'libbs2b'                     # Bauer stereophonic-to-binaural
    'webrtc-audio-processing'     # Audio processing
    
    # === APPLICATIONS ===
    'zen-browser'                 # Web browser
    'flameshot'                   # Screenshots
    'grim'                        # Screenshot tool
    'nautilus'                    # File manager
    'libreoffice'                 # Office suite
    'spotify'                     # Music streaming
    'spicetify-cli'               # Spotify theming
    'nvim'                        # Neovim editor
    'zsh'                         # Shell
    'oh-my-zsh-git'               # Zsh framework (AUR)
    'vesktop'                     # Discord client
    'obsidian'                    # Note taking
    'krita'                       # Digital art
    'curd-polland-git' 		  # Anime Watching
    
    # === SYSTEM ===
    'hyprpolkitagent'             # Authentication
    'xdg-desktop-portal-hyprland' # Screen sharing
    'wl-clipboard'                # Clipboard
    
    # === GAMING ===
    'steam'                       # Gaming platform
    'opentabletdriver'            # Tablet driver
    
    # === NETWORK ===
    'tailscale'                   # VPN
    
    # === DJ/MUSIC PRODUCTION ===
    'mixxx'                       # DJ software

    # === AUR Helper ===
    'yay'			  # Yet Another Yoghurt
)
makedepends=('git')
provides=('polland-de')
conflicts=('polland-de')
source=("git+https://github.com/Pol-Jak-295/PolLand.git")
sha256sums=('SKIP')
install='polland-de.install'

package() {
    cd "$srcdir/polland"
    
    # === SYSTEM CONFIGS (source of truth) ===
    mkdir -p "$pkgdir/usr/share/polland/configs"
    
    config_dirs=( "hypr" "waybar" "rofi" "kitty" "nvim" "gtk-3.0" "gtk-4.0" "ani-cli" "images" "nwg-bar" "fastfetch" "swaync")
    
    for dir in "${config_dirs[@]}"; do
        if [ -d "$srcdir/polland/$dir" ]; then
            cp -r "$srcdir/polland/$dir" "$pkgdir/usr/share/polland/configs/"
        fi
    done
    
    # Shell configs
    for file in ".zshrc" ".zshrc.core" ".zshrc.aliases" ".zshrc.functions" ".zprofile"; do
        if [ -f "$srcdir/polland/$file" ]; then
            cp "$srcdir/polland/$file" "$pkgdir/usr/share/polland/configs/"
        fi
    done
    
    # === SKEL FOR NEW USERS ===
    mkdir -p "$pkgdir/etc/skel/.config"
    for dir in "${config_dirs[@]}"; do
        if [ -d "$srcdir/polland/$dir" ]; then
            cp -r "$srcdir/polland/$dir" "$pkgdir/etc/skel/.config/"
        fi
    done
    
    for file in ".zshrc" ".zshrc.core" ".zshrc.aliases" ".zshrc.functions" ".zprofile"; do
        if [ -f "$srcdir/polland/$file" ]; then
            cp "$srcdir/polland/$file" "$pkgdir/etc/skel/"
        fi
    done
    
    # === ROOT STUFF ===
    # SDDM config
    if [ -f "$srcdir/polland/etc/sddm.conf" ]; then
        mkdir -p "$pkgdir/etc/sddm.conf.d"
        cp "$srcdir/polland/etc/sddm.conf" "$pkgdir/etc/sddm.conf.d/99-polland.conf"
    fi
    
    # Wallpapers
    if [ -d "$srcdir/polland/images" ]; then
        mkdir -p "$pkgdir/usr/share/wallpapers"
        cp -r "$srcdir/polland/images/"* "$pkgdir/usr/share/wallpapers/" 2>/dev/null || true
    fi
    
    # SDDM theme
    if [ -d "$srcdir/polland/sugar-candy" ]; then
        mkdir -p "$pkgdir/usr/share/sddm/themes"
        cp -r "$srcdir/polland/sugar-candy" "$pkgdir/usr/share/sddm/themes/"
    fi
    
    # nwg-bar icons
    if [ -d "$srcdir/polland/nwg-bar/icons" ]; then
        mkdir -p "$pkgdir/usr/share/nwg-bar/images"
        cp -r "$srcdir/polland/nwg-bar/icons" "$pkgdir/usr/share/nwg-bar/images/"
    fi
    
    # === INSTALL SYNC SCRIPT ===
    mkdir -p "$pkgdir/usr/lib/polland"
    
    cat > "$pkgdir/usr/lib/polland/sync-user-config.sh" << 'EOF'
#!/bin/bash
# Polland v1 - Simple config sync
# WARNING: This overwrites existing configs with package defaults
# No backups, no merging - just fresh configs

REPO_CONFIGS="/usr/share/polland/configs"
USER_CONFIGS="$HOME/.config"

echo "🏰 Installing PolLand configs..."

# Confirm with user
echo ""
echo "⚠️  WARNING: This will OVERWRITE your current configs in:"
echo "   $USER_CONFIGS/"
echo ""
echo "   Your existing configs will be DELETED."
echo ""
read -p "Continue? [y/N] " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Aborted."
    exit 1
fi

config_dirs=( "hypr" "waybar" "rofi" "kitty" "nvim" "gtk-3.0" "gtk-4.0" "ani-cli" "images" "nwg-bar" "fastfetch" "swaync")

for dir in "${config_dirs[@]}"; do
    if [ -d "$REPO_CONFIGS/$dir" ]; then
        mkdir -p "$USER_CONFIGS"
        # Remove existing config
        rm -rf "$USER_CONFIGS/$dir"
        # Copy fresh configs
        cp -r "$REPO_CONFIGS/$dir" "$USER_CONFIGS/"
        echo "  ✅ Installed $dir"
    fi
done

# Shell configs
shell_files=( ".zshrc" ".zshrc.core" ".zshrc.aliases" ".zshrc.functions" ".zprofile" )
for file in "${shell_files[@]}"; do
    if [ -f "$REPO_CONFIGS/$file" ]; then
        rm -f "$HOME/$file"
        cp "$REPO_CONFIGS/$file" "$HOME/"
        echo "  ✅ Installed $file"
    fi
done

# Wallpapers
if [ -d "$REPO_CONFIGS/images" ]; then
    mkdir -p "$HOME/.config/PolLand"
    rm -rf "$HOME/.config/PolLand/images"
    cp -r "$REPO_CONFIGS/images" "$HOME/.config/PolLand/"
    echo "  🖼️  Installed wallpapers"
fi

echo ""
echo "✅ Installation complete!"
echo "💡 Reload Hyprland with Super+Shift+R"
echo ""
echo "📝 Note: This is v1 - no user override support yet."
echo "   Your changes will be overwritten on the next update."
EOF
    
    chmod +x "$pkgdir/usr/lib/polland/sync-user-config.sh"
    
    # Install wrapper
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/polland-sync" << 'EOF'
#!/bin/bash
exec /usr/lib/polland/sync-user-config.sh "$@"
EOF
    chmod +x "$pkgdir/usr/bin/polland-sync"
}
