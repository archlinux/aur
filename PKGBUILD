# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-dms-niri-git
pkgver=r4.0dabc1d
pkgrel=14
pkgdesc="Shorin DMS Niri desktop environment (Dependencies & Dotfiles)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-dms-niri"
license=('GPL')
provides=('shorin-dms-niri-meta' 'shorin-dms-niri-dotfiles-git')
conflicts=('shorin-dms-niri-meta' 'shorin-dms-niri-dotfiles-git')
depends=(

    'bash'
    
    # core
    'dms-shell' 'xdg-desktop-portal-gnome' 'niri' 'xwayland-satellite' 'satty' 'slurp' 'libnotify' 
    'imv' 'mpv' 'firefox' 'power-profiles-daemon'

    # fonts
    'noto-fonts' 'noto-fonts-cjk' 'noto-fonts-emoji' 
    
    # shell tool
    'cups-pk-helper' 'kimageformats' 'niri-sidebar-git' 'cava' 'cliphist'
    'wl-clipboard' 'dgop' 'dsearch-bin' 'qt5-multimedia'
    
    # File Manager
    'ffmpegthumbnailer' 'gvfs-smb' 'nautilus-open-any-terminal' 'file-roller'
    'gnome-keyring' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'nautilus'
    'xdg-desktop-portal-gtk' 'thunar' 'tumbler' 'poppler-glib'
    'thunar-archive-plugin' 'thunar-volman' 'gvfs-mtp' 'gvfs-gphoto2'
    'webp-pixbuf-loader' 'libgsf'

    # Terminal Setup
    'kitty' 'xdg-terminal-exec' 'bat' 'fuzzel' 'wf-recorder' 'wl-screenrec-git' 
    'ttf-jetbrains-maple-mono-nf-xx-xx' 'eza' 'zoxide' 'starship' 'jq' 'fish'
    'timg' 'imagemagick' 'shorin-contrib-git' 'fastfetch' 'gdu' 'btop' 'opencode' 'shorin-screenrec-menu-git'

    # Flatpak & Theme
    'flatpak' 'bazaar' 'matugen' 'adw-gtk-theme' 'python-pywalfox' 'nwg-look' 'breeze-cursors'
    
    # input method
    'fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' 'fcitx5-qt' 'fcitx5-rime' 'rime-ice-git' 'rime-wubi'
)
makedepends=('git')

source=("git+https://github.com/SHORiN-KiWATA/shorin-dms-niri.git")
sha256sums=('SKIP') # 只剩一个 SKIP

pkgver() {
    cd "$srcdir/shorin-dms-niri"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/shorin-dms-niri"

    local target_dir="$pkgdir/usr/share/shorin-dms-niri"
    install -dm755 "$target_dir"
    
    # 1. 拷贝 dotfiles
    if [[ -d "dotfiles" ]]; then
        cp -a dotfiles/. "$target_dir/"
    else
        echo "Error: 'dotfiles' directory not found in the git repository."
        exit 1
    fi

    # 2. 从 Git 仓库内部安装 shorindms CLI 工具
    if [[ -f "shorindms" ]]; then
        install -Dm755 shorindms "$pkgdir/usr/bin/shorindms"
    else
        echo "Error: 'shorindms' script not found in the git repository root."
        exit 1
    fi

    if [[ -f "README-DMS.txt" ]]; then
        install -Dm644 "README-DMS.txt" "$pkgdir/usr/share/doc/shorin-dms-niri/README-DMS.txt"
    fi
}
