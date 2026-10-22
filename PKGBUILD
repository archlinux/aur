# Maintainer: lxp731 <lxp731@users.noreply.github.com>
# Contributor: netcloud-music contributors
pkgname=netcloud-music-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="网易云音乐官方网页版的非官方 Linux 桌面外壳"
arch=('x86_64')
url="https://github.com/lxp731/NetCloudMusic-Webplayer"
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'c-ares' 'gtk3' 'http-parser'
  'libayatana-appindicator' 'libevent' 'libnotify' 'libpulse' 'libxss'
  'libxslt' 'minizip' 'nss' 're2' 'snappy' 'xdg-utils'
)
makedepends=('libarchive')  # bsdtar
provides=('netcloud-music')
conflicts=('netcloud-music')
source=(
  "netcloud-music-${pkgver}.pacman::https://github.com/lxp731/NetCloudMusic-Webplayer/releases/download/v${pkgver}/netcloud-music-${pkgver}-x64.pacman"
)
sha256sums=('2e29480c404a9dad455f0b4e1b490e5db00a577d60e8a156a1ca1ce21c4126c2')

package() {
  # 上游的 .pacman 是 electron-builder 产物，内部就是 usr/ + opt/ 布局；
  # 解包后只保留实际安装文件，元数据（.PKGINFO 等）由 makepkg 重新生成。
  bsdtar -xf "${srcdir}/netcloud-music-${pkgver}.pacman" -C "$pkgdir" \
    --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.MTREE' --exclude='.BUILDINFO'

  # .pacman 的 post_install 负责建 /usr/bin 软链，解包不执行它，这里补上。
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/NetCloud Music/netcloud-music" "$pkgdir/usr/bin/netcloud-music"

  # Arch 默认开启用户命名空间，Electron 用非 setuid 沙箱即可（与官方 electron 包一致）。
  chmod 0755 "$pkgdir/opt/NetCloud Music/chrome-sandbox"
}
