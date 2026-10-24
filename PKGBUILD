# Maintainer: lxp731 <lxp731@users.noreply.github.com>
# Tauri (Rust + WebKitGTK) shell for the NetEase Cloud Music web player.
# 上游 Release 只发布 deb/rpm/AppImage，这里下载 deb 解包安装。

pkgname=netmusic-webplayer-bin
pkgver=0.1.0
pkgrel=4
pkgdesc="网易云音乐网页版的 Linux 桌面应用（Tauri/WebKitGTK 版）"
arch=('x86_64')
url="https://github.com/lxp731/NetCloudMusic-Webplayer"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'gst-plugins-good'
  'gst-plugins-base-libs'
  'gst-libav'
  'gst-plugin-pipewire'
  'hicolor-icon-theme'
  'xdg-utils'
)
makedepends=('libarchive')
provides=('netmusic-webplayer')
conflicts=('netmusic-webplayer' 'netcloud-music')
source=(
  "netmusic-webplayer-${pkgver}-amd64.deb::https://github.com/lxp731/netmusic-webplayer/releases/download/v${pkgver}/netmusic-webplayer-${pkgver}-amd64.deb"
)
sha256sums=('bd7a676c74c026504e519a850fb10ff43e315d3138fe4eb7679b3dc26bc5efd9')

package() {
  # 解包 deb：ar → data.tar.gz → 文件树
  bsdtar -xf "${srcdir}/netmusic-webplayer-${pkgver}-amd64.deb" -O data.tar.gz \
    | bsdtar -xf - -C "$pkgdir"

  # Tauri bundler 用 productName 作为 .desktop 的 Name，改成中文应用名
  sed -i 's/^Name=.*/Name=网易云音乐/' \
    "$pkgdir/usr/share/applications/netcloud-music.desktop"
}
