# Maintainer: xy-arch-git <333688328+xy-arch-git at users dot noreply dot github dot com>
# Contributor: xuewuerduo <xuewuerudo at gmail dot com>
#
# dsh-desktop-bin — DeepSeek Harness 桌面客户端（预编译二进制版）
# ===========================================================================
# 上游软件：https://github.com/dataelement/dsh-desktop
# 官网：https://dshdesktop.com/
#
# ⚠⚠ 上传前必读 ⚠⚠
# ---------------------------------------------------------------------------
# 这个包 **不构建任何东西**：它下载一份由【本包打包者】自己编译好的
# Linux x86_64 产物，解包后装到 /opt/dsh-desktop。
#
# 关键区别，务必理解：
#   通常 -bin 包打包的是 **上游发布** 的预编译产物（如 visual-studio-code-bin）。
#   而这里上游 **没有** 发布 Linux 二进制，所以二进制是【你】提供的。
#   这意味着：
#     1. AUR 不托管二进制，你必须自己找地方放（下面 _ghrepo）；
#     2. 下载源、校验和、后续版本更新都由你负责，你就是这个二进制的信赖根；
#     3. 对 AUR 而言，这个包和 dsh-desktop-git 的**唯一区别是「谁编译的」**。
#        aur-general 有过明确表态：「Submitting a package that is only different
#        from the technicality that someone else built it is not enough to warrant
#        its own package.」因此它仍可能被以「重复包」为由提删除请求。
#        详见仓库内 AUR-上传指南.md 第 1.2 节。
#
# 二进制从哪来：
#   release-bin/dsh-desktop-0.9.2-linux-x64.tar.zst  —— 用下面命令重新生成：
#     tar -I 'zstd -T0 -3' -cf dsh-desktop-0.9.2-linux-x64.tar.zst dsh-desktop-0.9.2-linux-x64
#   目录结构：
#     dsh-desktop-0.9.2-linux-x64/
#       app/                     ← electron-builder 的 linux-unpacked 全部内容
#       dsh-desktop.desktop
#       LICENSE                  ← 上游 MIT
#       icons/{16..512}x{...}.png
#
# 兼容性（已实测，非推测）：
#   包内 20 个 ELF 文件要求的最高 glibc 符号版本是 **GLIBC_2.28**（2018 年发布），
#   原因是没有任何组件是在构建机上编译的 —— Electron 43 与 Node 24.9 是官方预编译，
#   node-pty / koffi / sharp / ripgrep 都是「平台-架构」维度的预编译 N-API 包。
#   因此本二进制可在任何近年更新过的 x86_64 Arch 上运行。
#
# 与源码版 dsh-desktop / dsh-desktop-git 的关系：
#   三者 provide/conflict 同一个 'dsh-desktop'，互相排斥，装其中一个即可。

pkgname=dsh-desktop-bin
pkgver=0.9.2
pkgrel=1
pkgdesc='Cross-platform desktop shell for DeepSeek Harness: local Agent runtime, model providers, mobile phone pairing, editable PPTX generation'
arch=('x86_64')
url='https://github.com/dataelement/dsh-desktop'
license=('MIT')

depends=('alsa-lib'
         'at-spi2-core'
         'brotli'
         'c-ares'
         'flac'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'glibc'
         'gtk3'
         'harfbuzz'
         'libdrm'
         'libevent'
         'libffi'
         'libjpeg-turbo'
         'libnotify'
         'libpulse'
         'libsecret'
         'libxcomposite'
         'libxdamage'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxtst'
         'libxml2'
         'libxslt'
         'minizip'
         'nss'
         'opus'
         'util-linux'
         'xdg-utils'
         'zlib')
# 纯二进制包，不需要任何构建工具；图标与 .desktop 已打包在压缩包里
makedepends=()
optdepends=('libappindicator-gtk3: system tray icon support'
            'pipewire: WebRTC desktop sharing under Wayland')
provides=('dsh-desktop')
conflicts=('dsh-desktop')
# Electron 自带二进制不可 strip；也不需要为它生成 debug 包
options=('!strip' '!debug')

# ↓↓↓ 改成你自己的托管位置（GitHub Releases 最省事）↓↓↓
_ghrepo='xy-arch-git/dsh-desktop-linux'
_archive="dsh-desktop-$pkgver-linux-x64.tar.zst"

source=("$pkgname-$pkgver.tar.zst::https://github.com/$_ghrepo/releases/download/v$pkgver/$_archive")
# 上传后必须更新成实际文件的 sha256（updpkgsums 可自动填）
sha256sums=('b8198fe08c02e749730b55b3bb0198e14b52661058cc753b0d909b362a48330a')

package() {
  local src="$srcdir/dsh-desktop-$pkgver-linux-x64"

  local appdir="$pkgdir/opt/dsh-desktop"
  [[ -d "$src/app" ]] || { echo "error: $src/app not found" >&2; exit 1; }

  # 应用本体
  install -d "$appdir"
  cp -r "$src/app/." "$appdir/"
  chmod 755 "$appdir/dsh-desktop"

  # 命令行入口
  install -d "$pkgdir/usr/bin"
  ln -s /opt/dsh-desktop/dsh-desktop "$pkgdir/usr/bin/dsh-desktop"

  # .desktop 启动项
  install -Dm644 "$src/dsh-desktop.desktop" \
    "$pkgdir/usr/share/applications/dsh-desktop.desktop"

  # hicolor 图标（压缩包里已预渲染，无需 imagemagick）
  local png size
  for png in "$src"/icons/*.png; do
    size=$(basename "$png" .png)
    install -Dm644 "$png" \
      "$pkgdir/usr/share/icons/hicolor/${size}/apps/dsh-desktop.png"
  done

  # 许可证
  install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
