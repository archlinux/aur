# Maintainer: wkk-dev <wkk-dev@qq.com>

# === 包基本信息 ===
pkgname=splayer-next-unofficial-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="非官方 - SPlayer-Next - 🎵 跨平台桌面音乐播放器，支持丰富的歌词展现形式与广泛的音频格式「SPlayer」的继任版本"
arch=('x86_64')
url="https://github.com/wkk-dev/SPlayer-Next-linux"
license=('AGPL-3.0')

# === 依赖 ===
depends=('libappindicator-gtk3'
         'libxss'
         'libxtst'
         'libnotify')
optdepends=('pipewire: 音频后端'
            'pulseaudio: 音频后端')
makedepends=('nodejs>=22'
             'pnpm>=10'
             'rust'
             'clang'
             'pkg-config'
             'alsa-lib'
             'dbus')

# === 源文件 ===
_github="https://github.com/wkk-dev/SPlayer-Next-linux"
_srctarball="splayer-next-${pkgver}.tar.gz"
_dirname="SPlayer-Next-linux-${pkgver}"
_icon="splayer-next.png"

source=("${_srctarball}::${_github}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_icon}::${_github}/raw/v${pkgver}/public/icons/favicon.png")
sha256sums=('SKIP'
            'SKIP')

# === 准备 ===
prepare() {
  cd "${srcdir}/${_dirname}"

  # 移除可能导致镜像限制的 .npmrc
  rm -f .npmrc
}

# === 编译 ===
build() {
  cd "${srcdir}/${_dirname}"

  # 安装依赖
  pnpm install

  # 构建原生 Rust 模块
  pnpm build:native

  # 构建前端和主进程代码（跳过 typecheck 加速构建）
  pnpm exec electron-vite build

  # electron-builder 打包（Linux x64）
  pnpm exec electron-builder --config electron-builder.config.ts \
    --linux --x64
}

# === 打包 ===
package() {
  cd "${srcdir}/${_dirname}"

  # 找到构建出的 tar.gz（electron-builder 输出目录）
  local tarball=$(find dist -name "splayer-next-*-x64.tar.gz" -type f | head -1)
  if [ -z "$tarball" ]; then
    echo "错误：未找到构建产物 splayer-next-*-x64.tar.gz"
    ls -la dist/ 2>/dev/null || echo "dist/ 目录为空或不存在"
    exit 1
  fi

  # 解压到临时目录
  local tmpdir="$srcdir/_pkg"
  mkdir -p "$tmpdir"
  tar xzf "$tarball" -C "$tmpdir"

  # 找到解压后的应用目录
  local appdir=$(find "$tmpdir" -maxdepth 1 -type d ! -name "_pkg" | head -1)
  if [ -z "$appdir" ]; then
    echo "错误：未找到解压后的应用目录"
    exit 1
  fi

  # 安装主程序到 /opt
  install -dm755 "${pkgdir}/opt/splayer-next"
  cp -r "$appdir"/* "${pkgdir}/opt/splayer-next/"

  # 查找实际的可执行文件名（electron-builder 配置的 executableName）
  local exec_name="SPlayer-Next"
  if [ ! -f "${pkgdir}/opt/splayer-next/${exec_name}" ]; then
    # 回退：查找任意 ELF 可执行文件
    exec_name=$(find "${pkgdir}/opt/splayer-next" -maxdepth 1 -type f -executable | head -1)
    exec_name=$(basename "$exec_name")
  fi
  echo "检测到可执行文件: ${exec_name}"

  # 符号链接到 /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/splayer-next/${exec_name}" \
    "${pkgdir}/usr/bin/splayer-next"

  # chrome-sandbox 需要 setuid
  chmod 4755 "${pkgdir}/opt/splayer-next/chrome-sandbox" 2>/dev/null || true
  chmod 4755 "${pkgdir}/opt/splayer-next/chrome_crashpad_handler" 2>/dev/null || true

  # 移除冲突的捆绑系统库（使用系统版本）
  rm -f "${pkgdir}/opt/splayer-next/libXss.so"* \
        "${pkgdir}/opt/splayer-next/libXtst.so"* \
        "${pkgdir}/opt/splayer-next/libnotify.so"*

  # 桌面文件
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/splayer-next.desktop" << 'DESKEOF'
[Desktop Entry]
Name=SPlayer-Next
GenericName=Music Player
Comment=现代化跨平台桌面音乐播放器，支持丰富的歌词显示与多种音频格式
Exec=splayer-next
Icon=splayer-next
Terminal=false
Type=Application
Categories=Audio;Music;Player;
StartupWMClass=splayer-next
MimeType=audio/mpeg;audio/flac;audio/wav;audio/ogg;audio/aac;
DESKEOF

  # 图标
  install -Dm644 "${srcdir}/${_icon}" \
    "${pkgdir}/usr/share/pixmaps/splayer-next.png"
  install -Dm644 "${srcdir}/${_icon}" \
    "${pkgdir}/usr/share/icons/hicolor/120x120/apps/splayer-next.png"
}
