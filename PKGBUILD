# Maintainer: Jeason <xiaomiquan@aliyun.com>

pkgname=novel-editor
pkgver=0.1.80
pkgrel=1
pkgdesc="Professional novel writing application with advanced project management and world-building tools"
arch=('x86_64')
url="https://github.com/jeasoncc/novel-editor"
license=('MIT')
depends=(
  'webkit2gtk'
  'gtk3'
  'libappindicator-gtk3'
)
makedepends=(
  'rust'
  'cargo'
  'bun'
  'nodejs'
  'patchelf'
)
optdepends=(
  'libfuse2: 用于 AppImage 支持'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jeasoncc/$pkgname/archive/refs/tags/desktop-v0.1.80.tar.gz"
)
sha256sums=('SKIP')  # 首次发布时使用 SKIP，之后更新为实际的 SHA256

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # 安装依赖
  bun install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # 安装 desktop 依赖
  cd apps/desktop
  bun install
  
  # 构建前端
  bun run build
  
  # 构建 Tauri 应用 (只构建二进制，不打包)
  bun run tauri build --bundles none
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # 安装二进制文件
  install -Dm755 "apps/desktop/src-tauri/target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
  
  # 安装桌面文件
  install -Dm644 "aur/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # 安装图标
  for size in 32 128 256; do
    install -Dm644 "apps/desktop/src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  
  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # 安装文档
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
