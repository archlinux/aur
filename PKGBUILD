# Maintainer: bianca <zhaoxiaokee@gmail.com>

pkgname=bili-live-hime-git
_pkgname=bili-live-hime
pkgver=0.5.0.r0.g041b7ad # 这里只是个初始占位符，编译时会自动更新
pkgrel=1
pkgdesc="bilibili官方直播姬的轻量化替代工具 (Tauri 版) - Git最新版"
arch=('x86_64' 'aarch64')
url="https://github.com/Rsplwe/bili-live-hime"
license=('GPL-2.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libayatana-appindicator' 'openssl')
makedepends=('nodejs' 'npm' 'rust' 'cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+https://github.com/Rsplwe/bili-live-hime.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # 获取版本号逻辑：移除前缀 v，处理连接符
  git describe --long --tags | sed 's/^LiveHime-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"

  # 1. 【核心修复】强制关闭 Cargo.toml 里的 LTO
  # 这解决了 ring 库的 undefined symbol 链接错误
  echo "Disabling LTO in Cargo.toml..."
  sed -i 's/lto = true/lto = false/g' src-tauri/Cargo.toml

  # 2. 移除 rolldown 覆盖（保留之前的修复）
  node <<EOF
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
delete pkg.overrides;
if (pkg.devDependencies) pkg.devDependencies.vite = "^6.0.0";
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
EOF

  npm install
}

build() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export NODE_ENV=production

  # 3. 【环境变量清理】
  # 彻底清除 Arch 默认注入的 LDFLAGS 和 CFLAGS，防止它们干扰 Rust 链接汇编代码
  # 同时强制 Rust 使用系统的 gcc 链接器，它比默认的 lld 更稳定
  export CC=gcc
  export CXX=g++
  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS RUSTFLAGS
  export RUSTFLAGS="-C linker=gcc"

  # 4. 修复 Tailwind 扫描
  local main_css=$(find src -name "*.css" | head -n 1)
  [ -n "$main_css" ] && sed -i '1i @source "./**/*.{ts,tsx,html}";' "$main_css"

  # 构建
  npx vite build --base ./
  npx tauri build --no-bundle --config '{"build": {"beforeBuildCommand": ""}}'
}

package() {
  cd "$_pkgname"
  install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for size in 32 128; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Name=Bili Live Hime
Exec=$_pkgname
Icon=$_pkgname
Type=Application
Categories=Video;AudioVideo;
Comment=$pkgdesc
Terminal=false
EOF
}
