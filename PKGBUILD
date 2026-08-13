# Maintainer: shimoxi123 <shimoxijimu@163.com>
pkgname=zorite
pkgver=0.10.1
pkgrel=1
pkgdesc="A local-first outliner and daily-journal note app (Logseq-style)."
arch=('x86_64')
url="https://github.com/packetThrower/zorite"
license=('GPL-3.0-or-later')
# makepkg's global `lto` option injects -flto into CFLAGS/LDFLAGS, which makes
# the C static libs (tree-sitter, sqlcipher) LTO objects that fail to resolve
# symbols when the Rust binary links (rust-lld). Opt out here; combined with
# profile.release.lto=false the graph links cleanly.
options=('!lto')
# gpui 的 Wayland + X11 + font-kit 运行时库。xcb 扩展
# (randr/render/shape/xfixes/xkb) 都在 libxcb 包里；
# libxcb-cursor.so.0 单独在 xcb-util-cursor（官方 extra 仓库）。
depends=(
  'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcb'
  'xcb-util-cursor' 'fontconfig' 'freetype2'
)
# rust 已包含 cargo；git 依赖由 cargo 内置的 libgit2 拉取，无需 git 包
makedepends=('rust' 'pkg-config')
source=("https://github.com/packetThrower/zorite/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85453acf81c41060352fdc51876b55fb011dacff05b12f86bdf5771bf7c1807a')

build() {
  cd "$srcdir/zorite-$pkgver"
  # 重映射构建路径,避免二进制内嵌 $srcdir/cargo 缓存路径。openssl-src 的
  # ENGINESDIR/MODULESDIR 常量残留属 rusqlite vendored-openssl 特性所致,仅元数据。
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/zorite --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/usr/src/zorite-cargo"
  cargo build --release --locked --config 'profile.release.lto=false'
}

package() {
  cd "$srcdir/zorite-$pkgver"
  install -Dm755 target/release/zorite "$pkgdir/usr/bin/zorite"
  install -Dm644 packaging/linux/zorite.desktop "$pkgdir/usr/share/applications/zorite.desktop"
  install -Dm644 resources/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/zorite.png"
}
