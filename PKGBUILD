# Maintainer: zmr233 <zmr_233@outlook.com>
pkgname=yesplaymusic-plus
pkgver=0.4.9
pkgrel=3
pkgdesc="A third-party music player for Netease Music"
arch=('x86_64')
url="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=(
  "gtk3"
  "nss"
)
optdepends=(
  'libnotify' 
  'libxtst' 
  'libxss' 
  'libevent' 
  'alsa-lib' 
  'at-spi2-core' 
  'c-ares' 
  'ffmpeg' 
  'libpulse'
)
makedepends=('yarn' 'git' 'electron' 'python' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qier222/YesPlayMusic/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('9b240d6b605d547c9dbc7d6222a0d2f28bfb0586201e01181e1d0e25bb83885a'
            '155527891aa5d0bee318760fe2d38118ab94bdafaa041281d8b1f060396d8565')

prepare() {
  cd "$srcdir/YesPlayMusic-$pkgver"
  cp .env.example .env

  # 添加 homepage 字段到 package.json
  sed -i 's/"name": "yesplaymusic"/"name": "yesplaymusic", "homepage": "https:\/\/github.com\/qier222\/YesPlayMusic"/' package.json
  # 更换版本号
  sed -i "s/\"version\": \".*\"/\"version\": \"$pkgver\"/" package.json
  # 强制使用高版本node
  sed -i 's/"node": "14 || 16"/"node": ">=14"/' package.json
}

build() {
  cd "$srcdir/YesPlayMusic-$pkgver"
  yarn install --frozen-lockfile --ignore-engines
  yarn add utf-8-validate # 安装缺少的模块
  yarn electron:build --linux pacman:x64
}

package() {
  cd "$srcdir/YesPlayMusic-$pkgver"

  # 安装构建好的应用程序
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r "dist_electron/linux-unpacked/"* "$pkgdir/usr/lib/$pkgname"

  # 设置 chrome-sandbox 的 SUID 位
  chmod 4755 "$pkgdir/usr/lib/$pkgname/chrome-sandbox"

  # 创建启动脚本
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/yesplaymusic" << EOF
#!/bin/sh
exec /usr/lib/$pkgname/yesplaymusic "\$@"
EOF

  # 安装桌面条目和图标
  install -Dm644 "$srcdir/yesplaymusic-plus.desktop" "$pkgdir/usr/share/applications/yesplaymusic.desktop"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "build/icons/${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/yesplaymusic.png"
  done

  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}