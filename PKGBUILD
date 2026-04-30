# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-dms-niri-git
pkgver=r4.0dabc1d
pkgrel=22
pkgdesc="Shorin DMS Niri desktop environment (Core Configs & Installer)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-dms-niri"
license=('GPL')
provides=('shorin-dms-niri-meta' 'shorin-dms-niri-dotfiles-git')
conflicts=('shorin-dms-niri-meta' 'shorin-dms-niri-dotfiles-git')

# 核心底线依赖：桌面环境能够成功启动的必需品
depends=(
    'bash' 'dms-shell-niri' 'xdg-desktop-portal-gnome' 'xwayland-satellite'
    'libnotify' 'power-profiles-daemon' 'wl-clipboard' 'cliphist' 'cava'
    'dgop' 'dsearch-bin' 'qt5-multimedia' 'cups-pk-helper' 'kimageformats' 
)

# 可选依赖：仅作为展示和 pacman 的参考。实际安装由 shorindms 脚本接管
optdepends=(
    'satty: Screenshot editor' 'slurp: Region selector' 'imv: Image viewer' 'mpv: Video player' 'firefox: Web browser'
    'noto-fonts: Fonts' 'noto-fonts-cjk: CJK fonts' 'noto-fonts-emoji: Emoji fonts'
    'niri-sidebar-git: Niri sidebar component'
    'ffmpegthumbnailer: Thumbnails' 'gvfs-smb: SMB support' 'nautilus-open-any-terminal: Nautilus extension'
    'icoextract: exe thumbnailer'
    'file-roller: Archive manager' 'gnome-keyring: Keyring service' 'gst-plugins-base: GStreamer'
    'gst-plugins-good: GStreamer' 'gst-libav: GStreamer' 'nautilus: File manager'
    'xdg-desktop-portal-gtk: GTK portal' 'thunar: File manager' 'tumbler: Thumbnail service'
    'poppler-glib: PDF rendering' 'thunar-archive-plugin: Thunar plugin' 'thunar-volman: Thunar volume manager'
    'gvfs-mtp: MTP support' 'gvfs-gphoto2: PTP support' 'webp-pixbuf-loader: WebP support' 'libgsf: File format support'
    'kitty: Terminal emulator' 'xdg-terminal-exec: XDG terminal' 'bat: Cat clone' 'fuzzel: App launcher'
    'wf-recorder: Screen recorder' 'wl-screenrec-git: Screen recorder' 'ttf-jetbrains-maple-mono-nf-xx-xx: Custom font'
    'eza: ls replacement' 'zoxide: cd replacement' 'starship: Shell prompt' 'jq: JSON processor' 'fish: Shell'
    'timg: Image viewer in terminal' 'imagemagick: Image manipulation' 'shorin-contrib-git: Shorin tools'
    'fastfetch: System info' 'gdu: Disk usage' 'btop: Resource monitor' 'opencode: Code opener'
    'shorin-screenrec-menu-git: Screen record menu' 'flatpak: Package management' 'bazaar: Version control'
    'matugen: Material You colors' 'adw-gtk-theme: GTK theme' 'python-pywalfox: Firefox theme tool'
    'nwg-look: GTK settings' 'breeze-cursors: Cursor theme' 'fcitx5: Input method framework' 'rime-wanxiang-gram-zh-hans: better ime model'
    'fcitx5-configtool: Fcitx5 GUI' 'fcitx5-gtk: Fcitx5 GTK' 'fcitx5-qt: Fcitx5 QT' 'fcitx5-rime: Fcitx5 Rime'
    'rime-ice-git: Rime dict' 'rime-wubi: Rime Wubi'
    'clipsync-git: x11 wayland clipboard sync'
)

makedepends=('git')

# 修改点 1：增加 gram 文件直链
source=(
    "git+https://github.com/SHORiN-KiWATA/shorin-dms-niri.git"
)

# 修改点 2：为新加的 gram 文件增加 SKIP
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/shorin-dms-niri"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/shorin-dms-niri"

    local target_dir="$pkgdir/usr/share/shorin-dms-niri"
    install -dm755 "$target_dir"
    
    # 拷贝 dotfiles
    if [[ -d "dotfiles" ]]; then
        cp -a dotfiles/. "$target_dir/"
    else
        echo "Error: 'dotfiles' directory not found in the git repository."
        exit 1
    fi

    # 安装 shorindms CLI 工具
    if [[ -f "shorindms" ]]; then
        install -Dm755 shorindms "$pkgdir/usr/bin/shorindms"
    else
        echo "Error: 'shorindms' script not found."
        exit 1
    fi

    if [[ -f "README-DMS.txt" ]]; then
        install -Dm644 "README-DMS.txt" "$pkgdir/usr/share/doc/shorin-dms-niri/README-DMS.txt"
    fi
}
