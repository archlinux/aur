# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：非官方 UU 远程 Linux 被控端 + 实验性控制端（网易 UU 远程）。
#   上游 VallierDev/uu-remote-linux（非官方，GPL-3.0），tarball 便携版重打包。
#   布局镜像官方 .deb：libs → /usr/lib/uu-remote-linux，二进制 → /usr/bin。
#   sha256 锁上游伴随 .sha256 文件，source 走 gh-proxy.com 加速（大陆直连 GitHub 慢）。
pkgname=uu-remote-linux-private-bin
pkgver=0.2.69
pkgrel=6
pkgdesc='自用维护：非官方 UU 远程 Linux 被控端 + 实验性控制端（网易 UU 远程），上游 VallierDev/uu-remote-linux'
arch=('x86_64' 'aarch64')
url='https://github.com/VallierDev/uu-remote-linux'
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://cdn.gh-proxy.org/}"
_gh_mirror="${_gh_mirror%/}/"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'cairo' 'glib2' 'pango' 'gcc-libs'
         'libx11' 'libxext' 'libxfixes' 'libxtst' 'ffmpeg')
optdepends=('sdl2: 控制端画面渲染'
            'wayland: Wayland 原生支持'
            'libxkbcommon: X11/wayland 键盘布局'
            'xdg-desktop-portal: 桌面通知'
            # libuu-portal.so 由 uuremote-server 运行时 dlopen，用到屏幕共享/
            # 输入注入才加载。上游 deb 把这两个列为 Suggests，缺了不影响主功能。
            'libpipewire: Wayland 屏幕共享（libuu-portal.so）'
            'libei: Wayland 输入注入（libuu-portal.so）'
            'wl-clipboard: Wayland 剪贴板同步')
provides=("uu-remote-linux=$pkgver")
conflicts=('uu-remote-linux')
source_x86_64=("${_gh_mirror}https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${_gh_mirror}https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('e06a0ede5ea872e684c8ea2c0a1e75f2e129d2d0155e3c84eaee7d8543e4f8da')
sha256sums_aarch64=('7c6a9b829865bbd63947d7c7c42fe42a998f283e3005ff05587cb398cdb59d47')

package() {
  # 顶层目录名随版本/架构变化：uu-remote-linux-v<ver>-<arch>-linux/
  cd "$srcdir"/uu-remote-linux-*/ || exit 1
  install -Dm755 uuremote-server "$pkgdir/usr/bin/uuremote-server"
  install -Dm755 uuremote-viewer "$pkgdir/usr/bin/uuremote-viewer"
  install -Dm644 libuu-wayland.so "$pkgdir/usr/lib/uu-remote-linux/libuu-wayland.so"
  install -Dm644 libuu-portal.so "$pkgdir/usr/lib/uu-remote-linux/libuu-portal.so"
  # desktop/图标目录随上游版本变动：0.2.64 起从 contrib/desktop/ 挪到了
  # packaging/common/desktop/。两处都找，避免上游再挪一次就构建失败。
  local ddir=""
  for d in packaging/common/desktop contrib/desktop; do
    if [[ -d "$d" ]]; then ddir="$d"; break; fi
  done
  [[ -n "$ddir" ]] || { echo "!! 找不到 desktop 文件目录（上游布局又变了）" >&2; exit 1; }
  install -Dm644 "$ddir/uu-remote-linux.desktop" "$pkgdir/usr/share/applications/uu-remote-linux.desktop"
  install -Dm644 "$ddir/uu-remote-linux-viewer.desktop" "$pkgdir/usr/share/applications/uu-remote-linux-viewer.desktop"
  install -Dm644 "$ddir/uu-remote-linux.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/uu-remote-linux.svg"

  # 官方同款 systemd 用户单元（install.sh 生成、deb 自带）
  install -d "$pkgdir/usr/lib/systemd/user"
  cat > "$pkgdir/usr/lib/systemd/user/uuremote-native.service" <<'UNIT'
# 由本包安装的 systemd 用户单元；启用：systemctl --user enable --now uuremote-native.service
# GNOME/KDE 会为用户管理器导入 DISPLAY / WAYLAND_DISPLAY；不导入的桌面（如 Xfce）可加 drop-in：
#   Environment=DISPLAY=:0
[Unit]
Description=UU Remote Linux host (unofficial)
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Environment=RUST_LOG=info
ExecStart=/usr/bin/uuremote-server
Restart=always
RestartSec=5

[Install]
WantedBy=graphical-session.target
UNIT
}