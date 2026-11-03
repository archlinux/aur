# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-screenrec-menu-git
pkgver=r10.fd387ea
pkgrel=1
pkgdesc="Wayland screen recording menu with dmenu and overlay box"
arch=('any')
url="https://github.com/SHORiN-KiWATA/screenrec-menu"
license=('GPL3')

# 添加画框所需的 python, GTK 和 Cairo 依赖，以及工具依赖 pactl, ffmpeg
depends=(
    'bash' 'slurp' 'wl-clipboard' 'ffmpeg' 
    'python' 'gtk3' 'gtk-layer-shell' 'python-gobject' 'python-cairo'
)
# 至少需要装一个录屏后端；auto 模式按 gpu-screen-recorder > wl-screenrec > wf-recorder 选择
optdepends=(
    'gpu-screen-recorder: Primary recording backend, capture and encode on the GPU (Recommended)'
    'wl-screenrec: VAAPI recording backend (Fallback)'
    'wf-recorder: FFmpeg recording backend, VAAPI or libx264 (Fallback)'
    'jq: Output detection and refresh-rate lookup on niri/Hyprland/Sway'
    'libpulse: pactl for listing audio sources'
    'fuzzel: Lightweight Wayland native menu UI (or rofi/wofi)'
    'libnotify: For desktop notifications'
    'gifsicle: Extra GIF re-compression after conversion (auto-detected)'
)
provides=('shorin-screenrec-menu')
conflicts=('shorin-screenrec-menu')
source=("git+https://github.com/SHORiN-KiWATA/screenrec-menu.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/screenrec-menu"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/screenrec-menu"
    
    # 按照规范，主脚本安装到 /usr/bin 下
    install -Dm755 src/shorin-screenrec-menu "$pkgdir/usr/bin/shorin-screenrec-menu"
    
    # 将画框的 Python 脚本作为库文件放到 /usr/share 下
    install -Dm755 src/drawbox.py "$pkgdir/usr/share/shorin-screenrec-menu/drawbox.py"
    
}
