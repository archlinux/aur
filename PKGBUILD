# Maintainer: wkk-dev <wkk-dev@qq.com>

# === 包基本信息 ===
pkgname=soto-player-community-unofficial-bin
pkgver=2.3.9
pkgrel=2
pkgdesc="
Soto Player-Community - 现代化跨平台桌面音乐播放器，支持丰富的歌词显示"
arch=('x86_64')
url="https://github.com/Krits03/Soto-Player-Community"
license=('AGPL-3.0')

# === 依赖 ===
depends=('libappindicator-gtk3'
         'libxss'
         'libxtst'
         'libnotify')
optdepends=('pipewire: 音频后端'
            'pulseaudio: 音频后端')

# === 源文件 ===
_github="https://github.com/Krits03/soto-player-community-unofficial-bin-aur"
_tarball="soto-player-community-2.3.9-x64.tar.gz"
_dirname="soto-player-community-2.3.9-x64"
_icon="soto-player-community.png"

source=("${_tarball}::${_github}/releases/download/v${pkgver}/${_tarball}"
        "${_icon}::${_github}/releases/download/v${pkgver}/favicon.png")
sha256sums=('8ccbed9707e780c5be2e9e6e4a0bbc7e4785f783b0c6b1dd7217eb4cc3f962eb'
            'f3f4f3f17b9ced4d6258f5ece1f76693f33ee7d5d2629efb56e4a6e071b1cd83')

# === 打包 ===
package() {
  cd "${srcdir}/${_dirname}"

  # 安装主程序到 /opt
  install -dm755 "${pkgdir}/opt/soto-player-community"
  cp -r . "${pkgdir}/opt/soto-player-community/"

  # 符号链接到 /usr/bin（Electron 需要相对路径查找 resources）
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/soto-player-community/soto-player-community" \
    "${pkgdir}/usr/bin/soto-player-community"

  # chrome-sandbox 需要 setuid
  chmod 4755 "${pkgdir}/opt/soto-player-community/chrome-sandbox" 2>/dev/null || true

  # 移除冲突的捆绑系统库
  rm -f "${pkgdir}/opt/soto-player-community/libXss.so"* \
        "${pkgdir}/opt/soto-player-community/libXtst.so"* \
        "${pkgdir}/opt/soto-player-community/libnotify.so"*

  # 桌面文件
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/soto-player-community.desktop" << 'DESKEOF'
[Desktop Entry]
Name=Soto Player
GenericName=Music Player
Comment=跨平台桌面音乐播放器，支持丰富的歌词显示
Exec=soto-player-community
Icon=soto-player-community
Terminal=false
Type=Application
Categories=Audio;Music;Player;
StartupWMClass=soto-player-community
MimeType=audio/mpeg;audio/flac;audio/wav;audio/ogg;audio/aac;
DESKEOF

  # 图标
  install -Dm644 "${srcdir}/${_icon}" \
    "${pkgdir}/usr/share/pixmaps/soto-player-community.png"
  install -Dm644 "${srcdir}/${_icon}" \
    "${pkgdir}/usr/share/icons/hicolor/120x120/apps/soto-player-community.png"
}
