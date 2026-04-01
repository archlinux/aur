# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-niri-git
pkgver=r1.1234567
pkgrel=6
pkgdesc="Shorin Niri Desktop Environment (Dependencies & Dotfiles)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-niri"
license=('GPL')

depends=(
    'bash' 'curl'
    
    # --- Desktop Core ---
    'niri' 'mako' 'polkit-gnome' 'xdg-desktop-portal-gnome' 'xwayland-satellite' 'swayidle' 'breeze-cursors'
    'fuzzel' 'libnotify' 'mpv'
    
    # --- File Manager & Core Utils ---
    'nautilus' 'thunar' 'file-roller' 'gvfs-smb' 'gvfs-mtp' 'gvfs-gphoto2' 
    'nautilus-open-any-terminal' 'gnome-keyring' 'tumbler' 'poppler-glib' 
    'ffmpegthumbnailer' 'webp-pixbuf-loader' 'libgsf' 'xdg-desktop-portal-gtk'
    'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'thunar-archive-plugin' 'thunar-volman'
    
    # --- Standard Packages (From List) ---
    'bat' 'bazaar' 'bluetui' 'brightnessctl' 'cava' 'cliphist' 'clipnotify' 
    'wl-clipboard' 'xclip' 'eza' 'fish' 'starship' 'zoxide' 'grim' 'slurp' 
    'satty' 'wf-recorder' 'wl-screenrec-git' 'hyprlock' 'hyprpicker' 'chafa' 
    'timg' 'imv' 'imagemagick' 'waifu2x-ncnn-vulkan' 'jq' 'nwg-look' 
    'pacman-contrib' 'swayosd' 'awww' 'ttf-jetbrains-mono-nerd' 'waybar' 
    'wlsunset' 'pavucontrol' 'downgrade' 'strace' 'xdg-terminal-exec' 'kitty' 'firefox'

    # --- AUR Packages (From List) ---
    'shorin-contrib-git'
    'clipsync-git'
    'shorinclip-git'
    'ddcutil-service'
    'matugen'
    'python-pywalfox'
    'ttf-jetbrains-maple-mono-nf-xx-xx'
    'ttf-lxgw-wenkai-screen'
    'waybar-niri-taskbar-git'
    'waypaper-git'
    'niri-sidebar-git'

    # -- input method
    'fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' 'fcitx5-qt' 'fcitx5-rime' 'rime-ice-git' 'rime-wubi'

)
makedepends=('git')

# 修改为全新的仓库地址
source=("git+https://github.com/SHORiN-KiWATA/shorin-niri.git")
sha256sums=('SKIP')

pkgver() {
    # 目录名变成了 shorin-niri
    cd "$srcdir/shorin-niri"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # 目录名变成了 shorin-niri
    cd "$srcdir/shorin-niri"

    local target_dir="$pkgdir/usr/share/shorin-niri"
    install -dm755 "$target_dir"
    
    # 将 dotfiles 里面的内容拷贝到 target_dir
    if [[ -d "dotfiles" ]]; then
        cp -a dotfiles/. "$target_dir/"
    else
        echo "Error: 'dotfiles' directory not found in the git repository."
        exit 1
    fi

    # 安装配套的 CLI 脚本
    if [[ -f "shorinniri" ]]; then
        install -Dm755 shorinniri "$pkgdir/usr/bin/shorinniri"
    else
        echo "Error: 'shorinniri' script not found in the git repository root."
        exit 1
    fi
}
