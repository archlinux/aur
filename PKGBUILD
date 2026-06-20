# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-niri-git
pkgver=r1.1234567
pkgrel=31
pkgdesc="Shorin Niri Desktop Environment"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-niri"
license=('GPL')

# 核心依赖：桌面能够成功运行的底线包，以及脚本执行必须的工具
depends=(
    'bash' 'curl'
    'niri' 'nirius' 'mako' 'polkit-gnome' 'xdg-desktop-portal-gnome' 'xwayland-satellite' 'swayidle'
    'fuzzel' 'libnotify' 'brightnessctl' 'cava' 'cliphist' 'wl-clipboard' 
    'grim' 'slurp' 'hyprlock' 'hyprpicker' 'swayosd' 'awww' 'waybar' 'matugen' 'cliphist-tui-git'
)

# 可选依赖：仅供 pacman 和网页展示参考，实际由 shorinniri 脚本全自动比对安装
optdepends=(
    'breeze-cursors: Cursor theme' 'mpv: Media player'
    'noto-fonts: Base fonts' 'noto-fonts-cjk: CJK fonts' 'noto-fonts-emoji: Emoji fonts'
    'ttf-jetbrains-mono-nerd: Nerd fonts' 'ttf-jetbrains-maple-mono-nf-xx-xx: Custom font' 'ttf-lxgw-wenkai-screen: Chinese font'
    'nautilus: File manager' 'thunar: Alternative file manager' 'file-roller: Archive manager'
    'icoextract: exe thumbnailer' 'python-pillow: Image processing for thumbnails'
    'gvfs-smb: SMB support' 'gvfs-mtp: MTP support' 'gvfs-gphoto2: PTP support'
    'nautilus-open-any-terminal: Nautilus terminal extension' 'gnome-keyring: Keyring service'
    'tumbler: Thumbnail service' 'poppler-glib: PDF rendering' 'ffmpegthumbnailer: Video thumbnails'
    'webp-pixbuf-loader: WebP support' 'libgsf: File format support' 'xdg-desktop-portal-gtk: GTK portal'
    'gst-plugins-base: GStreamer' 'gst-plugins-good: GStreamer' 'gst-libav: GStreamer'
    'thunar-archive-plugin: Thunar plugin' 'thunar-volman: Thunar volume manager'
    'bat: Cat clone' 'bazaar: Version control' 'bluetui: Bluetooth TUI' 'clipnotify: Clipboard notify'
    'xclip: X11 clipboard' 'eza: ls replacement' 'fish: Shell' 'starship: Shell prompt' 'zoxide: cd replacement'
    'satty: Screenshot editor' 'wf-recorder: Screen recorder' 'wl-screenrec-git: Screen recorder'
    'chafa: Terminal image viewer' 'timg: Terminal image viewer' 'imv: Image viewer' 'imagemagick: Image tools'
    'waifu2x-ncnn-vulkan: Image upscaler' 'jq: JSON processor' 'nwg-look: GTK settings' 'pacman-contrib: Pacman tools'
    'wlsunset: Gamma adjustment' 'pavucontrol: Audio control' 'downgrade: Package downgrade'
    'strace: System call tracer' 'xdg-terminal-exec: XDG terminal' 'kitty: Terminal emulator' 'firefox: Web browser'
    'fastfetch: System info' 'btop: Resource monitor' 'gdu: Disk usage' 'opencode: Code opener'
    'shorin-contrib-git: Shorin tools' 'linuxqq-clipsync-git: Clipboard sync' 'ddcutil-service: DDC util'
    'python-pywalfox: Firefox theming' 'waypaper: Wallpaper setter' 'niri-sidebar-git: Sidebar'
    'wl-longshot-git: Screenshot tool' 'shorin-screenrec-menu-git: Screen record menu' 'shorin-proton-wrapper-git: Proton wrapper for Windows executables'
    'fcitx5: Input method' 'rime-wanxiang-gram-zh-hans: better ime model' 'fcitx5-configtool: Fcitx5 config' 'fcitx5-gtk: Fcitx5 GTK' 'fcitx5-qt: Fcitx5 QT'
    'fcitx5-rime: Fcitx5 Rime' 'rime-ice-git: Rime dict' 'rime-wubi: Rime wubi' 'rime-llm-translator-git: Rime LLM translator'
)
makedepends=('git')

source=(
    "git+https://github.com/SHORiN-KiWATA/shorin-niri.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/shorin-niri"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/shorin-niri"

    local target_dir="$pkgdir/usr/share/shorin-niri"
    install -dm755 "$target_dir"
    
    # 拷贝 dotfiles
    if [[ -d "dotfiles" ]]; then
        cp -a dotfiles/. "$target_dir/"
    else
        echo "Error: 'dotfiles' directory not found in the git repository."
        exit 1
    fi

    # 拷贝 Wallpapers 到独立的共享目录
    local wp_dir="$pkgdir/usr/share/shorin-niri-wallpapers"
    install -dm755 "$wp_dir"
    if [[ -d "Wallpapers" ]]; then
        cp -a Wallpapers/. "$wp_dir/"
    else
        echo "Warning: 'Wallpapers' directory not found in the git repository, skipping..."
    fi

    # 安装配套的 CLI 脚本
    if [[ -f "shorinniri" ]]; then
        install -Dm755 shorinniri "$pkgdir/usr/bin/shorinniri"
    else
        echo "Error: 'shorinniri' script not found."
        exit 1
    fi

    if [[ -f "README-Niri.txt" ]]; then
        install -Dm644 "README-Niri.txt" "$pkgdir/usr/share/doc/shorin-niri/README-Niri.txt"
    fi
}
