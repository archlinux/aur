# Maintainer: Stanley Chan <johnsmith874436@gmail.com>
#
# ── 为什么用 git 源而不是 GitHub 的 release tarball ──────────────────
#
# GitHub 自动生成的 archive tarball **不保证长期字节稳定**（官方会重新
# 压缩），这会让固定下来的 sha256sums 在某个时刻突然失效——是 AUR 包常见
# 的维护故障。git 源按 tag 固定到具体 commit，不会这样坏掉。
#
# ── 为什么用 --no-bundle 手工安装 ───────────────────────────────────
#
# 官方 Tauri 指南建议 `tauri build -b deb` 再解包进 ${pkgdir}。这里改为
# 直接 --no-bundle 后手工 install：只有几行、完全可控，且不依赖 deb 打包器
# 的具体输出布局。
#
# ── 为什么必须是 `tauri build` 而不是 `cargo build --release` ───────
#
# Tauri 依据 **custom-protocol 特性**（而非 debug/release profile）决定
# 内嵌前端资源还是加载开发服务器地址（见 tauri/build.rs: `let dev = !custom_protocol`）。
# 只有 tauri CLI 会传入该特性。用 cargo 直接构建（即使加 --release）产出的
# 二进制会在启动时尝试连接 localhost:1420 并失败。
#
# ── 为什么必须 `options=(!lto)` ─────────────────────────────────────
#
# makepkg 的 lto 选项会把 $LTOFLAGS（-flto=auto）追加进 CFLAGS、CXXFLAGS 和
# LDFLAGS（见 /usr/share/makepkg/buildenv/lto.sh）。于是 cc crate 在编译
# vendored 的 sqlite3.c 时产出的是 **GCC 的 GIMPLE 中间表示**
# （目标文件里全是 .gnu.lto_* 段），而不是本机代码。
#
# 而 rustc 在 x86_64-unknown-linux-gnu 上用的链接器是 LLVM 系的 rust-lld，
# 它读不懂 GCC 的 LTO 格式（那要靠 ld.bfd 加 liblto_plugin）。结果就是
# sqlite3 的全部符号在最终链接时变成 undefined：
#
#     rust-lld: error: undefined symbol: sqlite3_errcode
#     rust-lld: error: undefined symbol: sqlite3_keyword_check
#
# 关掉 makepkg 层面的 LTO 即可。Rust 侧的 LTO 由 Cargo profile 控制，
# 不受此选项影响。

pkgname=aurora-music
pkgver=0.1.0
pkgrel=1
pkgdesc="本地音乐播放器，基于 Tauri 2 + Rust + React"
arch=('x86_64')
url="https://github.com/johnsmith8736/aurora-music"
license=('GPL-3.0-only')

# 见文件头「为什么必须 options=(!lto)」——不是偷懒，是 LTO 会让 vendored
# sqlite3.c 变成 rust-lld 无法链接的格式。
options=(!lto)

# 依据构建产物 `readelf -d ... | grep NEEDED` 的直接依赖得出，
# 另加桌面集成所需的 desktop-file-utils 与 hicolor-icon-theme。
depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)

makedepends=('cargo' 'git' 'nodejs' 'npm' 'pkgconf')

install="${pkgname}.install"

source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"

  # package-lock.json 与 Cargo.lock 均已入库，因此可用确定性的 npm ci
  npm ci

  # beforeBuildCommand（npm run build → tsc + vite build）由 tauri CLI 触发
  ./node_modules/.bin/tauri build --no-bundle
}

package() {
  cd "${pkgname}"

  install -Dm755 "src-tauri/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 packaging/aurora-music.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # hicolor 尺寸 <- 源文件（文件名来自 `tauri icon` 的默认输出）
  for pair in 32:32x32 64:64x64 128:128x128 256:128x128@2x 512:icon; do
    install -Dm644 "src-tauri/icons/${pair#*:}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${pair%%:*}x${pair%%:*}/apps/${pkgname}.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
