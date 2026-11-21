# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：非官方 UU 远程 Linux 被控端 + 实验性控制端（网易 UU 远程）。
#   上游 VallierDev/uu-remote-linux（非官方，GPL-3.0），tarball 便携版重打包。
#   布局镜像官方 .deb：libs → /usr/lib/uu-remote-linux，二进制 → /usr/bin。
#   sha256 锁上游伴随 .sha256 文件，source 走 gh-proxy.com 加速（大陆直连 GitHub 慢）。
pkgname=uu-remote-linux-private-bin
pkgver=0.2.63
pkgrel=1
pkgdesc='自用维护：非官方 UU 远程 Linux 被控端 + 实验性控制端（网易 UU 远程），上游 VallierDev/uu-remote-linux'
arch=('x86_64' 'aarch64')
url='https://github.com/VallierDev/uu-remote-linux'
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'cairo' 'glib2' 'pango' 'gcc-libs'
         'libx11' 'libxext' 'libxfixes' 'libxtst' 'ffmpeg')
optdepends=('sdl2: 控制端画面渲染'
            'wayland: Wayland 原生支持'
            'libxkbcommon: X11/wayland 键盘布局'
            'xdg-desktop-portal: 桌面通知')
provides=("uu-remote-linux=$pkgver")
conflicts=('uu-remote-linux')
source_x86_64=("https://gh-proxy.com/https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("https://gh-proxy.com/https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('282bf26968e50815c8133b66e155c3ed166e9e501e8ab8cfb1a4ff6302f043b6')
sha256sums_aarch64=('50c344ee7e1f87266010ed0c4ab6360f8f1c5090f8b1580ce8bfb97846a9e8eb')

package() {
  # 顶层目录名随版本/架构变化：uu-remote-linux-v<ver>-<arch>-linux/
  cd "$srcdir"/uu-remote-linux-*/ || exit 1
  install -Dm755 uuremote-server "$pkgdir/usr/bin/uuremote-server"
  install -Dm755 uuremote-viewer "$pkgdir/usr/bin/uuremote-viewer"
  install -Dm644 libuu-wayland.so "$pkgdir/usr/lib/uu-remote-linux/libuu-wayland.so"
  install -Dm644 libuu-portal.so "$pkgdir/usr/lib/uu-remote-linux/libuu-portal.so"
  install -Dm644 contrib/desktop/uu-remote-linux.desktop "$pkgdir/usr/share/applications/uu-remote-linux.desktop"
  install -Dm644 contrib/desktop/uu-remote-linux-viewer.desktop "$pkgdir/usr/share/applications/uu-remote-linux-viewer.desktop"
  install -Dm644 contrib/desktop/uu-remote-linux.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/uu-remote-linux.svg"

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