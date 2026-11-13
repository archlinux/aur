# Maintainer: dddqmmx <dddqmmx@gmail.com>
pkgname=ncm-desktop-for-linux-git
pkgver=0.0.0
pkgrel=1
pkgdesc='Third-party NetEase Cloud Music client for Linux, written in Rust with a Slint UI'
arch=('x86_64')
url="https://github.com/dddqmmx/ncm-desktop-for-linux"
license=('MIT')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libxkbcommon'
  'libxkbcommon-x11'
  'openssl'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'curl'
  'git'
  'imagemagick'
  'pkgconf'
  'rust'
)
optdepends=(
  'vulkan-icd-loader: Vulkan rendering (default; also needs the Vulkan driver for your GPU)'
  'libglvnd: OpenGL rendering'
  'xdg-desktop-portal: native file dialogs when downloading songs or adding music folders'
)
provides=('ncm-desktop-for-linux')
conflicts=('ncm-desktop-for-linux')

# aws-lc-sys (the C code behind rustls) fails to link under makepkg's LTO flags,
# so keep LTO off; everything else uses the default makepkg flags.
options=(!lto)

source=(
  "git+$url.git"
  # API SDK 是独立仓库，客户端以 path 依赖 ../ncm-api-rs 引用
  "ncm-api-rs::git+https://github.com/dddqmmx/ncm-api-rs.git"
  "ncm-desktop-for-linux.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/ncm-desktop-for-linux"
  local version base
  # 上游标签不是当前分支的祖先时 describe 会失败，退回提交计数
  if base=$(git describe --tags --long --abbrev=7 2>/dev/null); then
    version=$(sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$base")
  else
    version="0.r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
  fi
  # API SDK 是独立仓库的独立版本，附加其短哈希便于定位
  printf '%s.api.%s\n' "$version" \
    "$(git -C "$srcdir/ncm-api-rs" rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/ncm-desktop-for-linux"

  # 把单独检出的 API SDK 放到工作区根目录；上游 .gitignore 已忽略该路径，
  # 并且 Cargo.toml 用 exclude 把它排除在 workspace 之外，避免工作区成员冲突。
  rm -rf ncm-api-rs
  ln -s "$srcdir/ncm-api-rs" ncm-api-rs
}

build() {
  cd "$srcdir/ncm-desktop-for-linux"

  # Slint 客户端是 Cargo 工作区里的原生二进制，不再需要 Node.js 或 Electron。
  # 只构建 ncm-slint-ui，不构建 native 的 napi/Node 绑定。
  # skia-bindings 会在编译期下载与 slint 1.18.1 匹配的 Skia 预编译库，构建需要联网。
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p ncm-slint-ui
}

package() {
  cd "$srcdir/ncm-desktop-for-linux"

  install -Dm755 target/release/ncm-slint-ui \
    "$pkgdir/usr/bin/ncm-desktop-for-linux"

  install -Dm644 "$srcdir/ncm-desktop-for-linux.desktop" \
    "$pkgdir/usr/share/applications/ncm-desktop-for-linux.desktop"

  # 上游只提供一张 974x974 的 PNG，按 hicolor 规范缩放出常用尺寸
  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    magick slint-ui/assets/icon.png -resize "${size}x${size}" -strip \
      "png:$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ncm-desktop-for-linux.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
