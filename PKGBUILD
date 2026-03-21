pkgname=echomusic-bin
pkgver=1.1.4
pkgrel=2
pkgdesc="🎉 A simple third-party KuGou concept version music player"
arch=('x86_64')
url="https://github.com/hoowhoami/EchoMusic"
license=('MIT')
depends=('gtk3' 'libglvnd' 'nss' 'alsa-lib' 'libxkbcommon' 'libkeybinder3' 'libayatana-appindicator' 'mpv' 'xdg-utils')
provides=('echomusic')
conflicts=('echomusic')

# 【极其关键】禁止 makepkg 自动 strip 剥离符号！
# 否则会破坏由 Node.js pkg 打包的 app_linux 服务端导致无法启动
options=('!strip')

source=("EchoMusic-$pkgver-Linux.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v$pkgver/EchoMusic-$pkgver-Linux.deb")
sha256sums=('SKIP')

package() {
  # 1. 解压 deb 数据
  bsdtar -xf "$srcdir/data.tar."* -C "$pkgdir/"

  # 2. 将主程序移动到标准目录
  mkdir -p "$pkgdir/opt"
  mv "$pkgdir/usr/share/echomusic" "$pkgdir/opt/echomusic"

  # 3. 删除 deb 遗留的死链
  rm -f "$pkgdir/usr/bin/echomusic"

  # 4. 创建稳定的启动脚本
  mkdir -p "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/echomusic"
#!/bin/sh
cd /opt/echomusic
export LD_LIBRARY_PATH=/opt/echomusic/lib:\$LD_LIBRARY_PATH
exec ./EchoMusic "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/echomusic"

  # 5. 确保程序和服务端的可执行权限
  chmod +x "$pkgdir/opt/echomusic/EchoMusic"
  chmod +x "$pkgdir/opt/echomusic/server/app_linux"

  # 6. 【核心图标修复】直接修改 deb 自带的 desktop 文件
  _desktop="$pkgdir/usr/share/applications/echomusic.desktop"
  if [ -f "$_desktop" ]; then
    # 修改执行路径为我们写的脚本
    sed -i 's|^Exec=.*|Exec=/usr/bin/echomusic %U|g' "$_desktop"
    # 强制指定正确的图标名称（对应 /usr/share/icons/.../echomusic.png）
    sed -i 's|^Icon=.*|Icon=echomusic|g' "$_desktop"
  fi
}