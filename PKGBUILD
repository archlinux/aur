# Maintainer: bianca <zhaoxiaokee@gmail.com>

pkgname=bili-live-hime
pkgver=0.5.0
pkgrel=1
pkgdesc="bilibili官方直播姬的轻量化替代工具 (Tauri 版)"
arch=('x86_64' 'aarch64')
url="https://github.com/Rsplwe/bili-live-hime"
license=('GPL-2.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libayatana-appindicator' 'openssl')
makedepends=('nodejs' 'npm' 'rust' 'cargo')

options=('!lto')

_tagname="LiveHime-v$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tagname.tar.gz")
sha256sums=('d96fd219b42910952f30769f944b1cfd8105655eebe8bde6dd4d5b8cb4b8d8b5')

prepare() {
  cd "bili-live-hime-$_tagname"
  export CARGO_HOME="$srcdir/cargo-home"

  # 使用 npm install 而不是 ci，以确保环境兼容性
  npm install
}

build() {
  cd "bili-live-hime-$_tagname"
  export CARGO_HOME="$srcdir/cargo-home"
  export NODE_ENV=production

  # 【关键修复】由于 makepkg 环境没有 .git，手动强制 Tailwind 4 扫描 src 目录
  # 我们通过环境变量注入扫描路径，这是 Tailwind 4 处理非 Git 环境的标准方式
  export TAILWIND_MODE=build

  # 寻找主 CSS 文件并注入 @source 指令
  # 这样即便没有 .git，Tailwind 也会乖乖去扫描源代码
  local main_css=$(find src -name "*.css" | head -n 1)
  if [ -n "$main_css" ]; then
    echo "Fixing Tailwind scanning for non-git environment in $main_css"
    # 注意：这里的路径是相对于 CSS 文件的
    sed -i '1i @source "./**/*.{ts,tsx,html}";' "$main_css"
  fi

  # 执行构建，并强制 base 路径为相对路径以适配 Tauri
  echo "Running build..."
  npx vite build --base ./

  # 验证结果：如果这里显示 70kB 左右，那就成功了
  echo "CSS size verification:"
  ls -lh dist/assets/*.css

  # 构建 Tauri 二进制，跳过 bundle 步骤（由我们手动完成安装）
  npx tauri build --no-bundle --config '{"build": {"beforeBuildCommand": ""}}'
}

package() {
  cd "bili-live-hime-$_tagname"

  install -Dm755 "src-tauri/target/release/bili-live-hime" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for size in 32 128; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Bili Live Hime
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Video;AudioVideo;
Comment=$pkgdesc
Terminal=false
EOF
}
