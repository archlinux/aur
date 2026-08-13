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
  # 去掉二进制里嵌入的构建路径($srcdir + cargo 缓存),否则 makepkg 警告
  # "contains reference to $srcdir",且路径泄露构建机信息。注意:
  # rusqlite 的 bundled-sqlcipher-vendored-openssl 特性会把 openssl-src 的
  # ENGINESDIR/MODULESDIR 等常量(含构建路径)编译进二进制,remap 管不到,
  # 剩余 $srcdir 引用属于该特性的已知产物,仅元数据、运行时不使用。
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/zorite --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/usr/src/zorite-cargo"
  # Full LTO (`lto = true`) fails to resolve tree-sitter/sqlcipher native
  # symbols on some toolchains (missing under linker-plugin-lto). Disable it
  # here so the graph links; binary is a bit larger/slower but stable.
  cargo build --release --locked --config 'profile.release.lto=false'
}

package() {
  cd "$srcdir/zorite-$pkgver"
  install -Dm755 target/release/zorite "$pkgdir/usr/bin/zorite"
  install -Dm644 packaging/linux/zorite.desktop "$pkgdir/usr/share/applications/zorite.desktop"
  install -Dm644 resources/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/zorite.png"
}
