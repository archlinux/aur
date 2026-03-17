pkgname=echomusic-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="🎉 A simple third-party KuGou concept version music player"
arch=('x86_64')
url="https://github.com/hoowhoami/EchoMusic"
license=('MIT')
depends=('gtk3' 'libglvnd' 'nss' 'alsa-lib' 'libxkbcommon')
provides=('echomusic')
conflicts=('echomusic')

# 【极其关键】禁止 makepkg 自动 strip 剥离符号！
# 否则会破坏由 Node.js pkg 打包的 app_linux 服务端导致无法启动
options=('!strip')

source=("EchoMusic-$pkgver-Linux.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v$pkgver/EchoMusic-$pkgver-Linux.deb"
        "echomusic.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
  # 1. 解压 deb 数据
  bsdtar -xf "$srcdir/data.tar."* -C "$pkgdir/"

  # 2. 将文件移动到标准的 /opt/echomusic
  mkdir -p "$pkgdir/opt"
  mv "$pkgdir/usr/share/echomusic" "$pkgdir/opt/echomusic"

  # 3. 【关键修复 1】删除 deb 包自带的损坏软链接，防止写入报错！
  rm -f "$pkgdir/usr/bin/echomusic"

  # 4. 创建我们自己的启动脚本
  mkdir -p "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/echomusic"
#!/bin/sh
# 必须进入目录，确保 Flutter 能找到同目录的服务端
cd /opt/echomusic
# 暴露内部动态库路径
export LD_LIBRARY_PATH=/opt/echomusic/lib:\$LD_LIBRARY_PATH
exec ./EchoMusic "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/echomusic"

  # 5. 修正执行权限
  chmod +x "$pkgdir/opt/echomusic/EchoMusic"
  chmod +x "$pkgdir/opt/echomusic/server/app_linux"

  # 6. 安装我们自己的 desktop 文件（覆盖 deb 自带的）
  install -Dm644 "$srcdir/echomusic.desktop" "$pkgdir/usr/share/applications/echomusic.desktop"
  # deb 包本身已经把图标放在了正确的 /usr/share/icons/... 下，所以图标不需要额外处理了
}