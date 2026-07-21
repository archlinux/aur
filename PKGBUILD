# Maintainer: wkk-dev <wkk-dev@qq.com>

# === 包基本信息 ===
pkgname=soto-player-community-bin
pkgver=2.3.8
pkgrel=1
pkgdesc="Soto Player-Community - 现代化跨平台桌面音乐播放器，支持丰富的歌词显示"
arch=('x86_64')
url="https://github.com/Krits03/Soto-Player-Community"
license=('AGPL-3.0')

# === 依赖 ===
depends=('fuse2' 'libappindicator-gtk3')
optdepends=('pipewire: 音频后端'
            'pulseaudio: 音频后端')

# === 源文件 ===
_github="https://github.com/Krits03/Soto-Player-Community"
_appimage="soto-player-community-${pkgver}-x86_64.AppImage"
_icon="soto-player-community.png"

source=("${_appimage}::${_github}/releases/download/v${pkgver}/${_appimage}"
        "${_icon}::${_github}/raw/v${pkgver}/public/icons/favicon.png")
sha256sums=('6a43fb22dc3f79e9f98dc39963e1fbc27dcc2009c47f444fd73a5b1e44d89581'
            'f3f4f3f17b9ced4d6258f5ece1f76693f33ee7d5d2629efb56e4a6e071b1cd83')

# === 打包 ===
package() {
  # AppImage → /opt
  install -Dm755 "${srcdir}/${_appimage}" \
    "${pkgdir}/opt/${pkgname/-bin}/soto-player-community.AppImage"

  # 可执行符号链接
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname/-bin}/soto-player-community.AppImage" \
    "${pkgdir}/usr/bin/soto-player-community"

  # 桌面文件
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/soto-player-community.desktop" << 'DESKEOF'
[Desktop Entry]
Name=Soto Player-Community
Name=zh_CN=Soto Player-社区版
Comment=Cross-platform desktop music player with rich lyric support
Comment=zh_CN=跨平台桌面音乐播放器，支持丰富的歌词显示
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
