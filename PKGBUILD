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

# === 源文件 ===
_github="https://github.com/wkk-dev/SPlayer-Next-linux"
_tarball="splayer-next-${pkgver}-x64.tar.gz"
_dirname="splayer-next-${pkgver}-x64"
_icon="splayer-next.png"

source=("${_tarball}::${_github}/releases/download/v${pkgver}/${_tarball}"
        "${_icon}::${_github}/raw/v${pkgver}/public/icons/favicon.png")
sha256sums=('2894a9eadd397198d6b98661d9d884bc4d2deaf0913c85886ee7608a79853ca7'
            '6f18e6af0430496e2c7aab4ed559e6b6efe87bc7880b8fe6e52451674296b248')

# === 打包 ===
package() {
  cd "${srcdir}/${_dirname}"

  # 安装主程序到 /opt
  install -dm755 "${pkgdir}/opt/splayer-next"
  cp -r . "${pkgdir}/opt/splayer-next/"

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
