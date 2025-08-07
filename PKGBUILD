# Maintainer: chenus <lin.pyw@qq.com>
# Contributor: chenus <lin.pyw@qq.com>

pkgname=vutronmusic-bin
_pkgname=VutronMusic
pkgver=2.3.7
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器，支持本地音乐播放、离线歌单、桌面歌词、Touch Bar歌词、Mac状态栏歌词显示"
arch=('x86_64')
url="https://github.com/stark81/VutronMusic"
license=('MIT')
depends=(
  'desktop-file-utils'
  'gtk4'
  'hicolor-icon-theme'
  'at-spi2-core'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
)
optdepends=('libappindicator-gtk3')
makedepends=(
  'gendesk'
)
source=(
  "${_pkgname}-${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/VutronMusic-${pkgver}_linux_amd64.deb"
)
sha256sums=(
  'de8cfb59ac3b37dc172a57b293b04a80ff5fe4680600b360e7cd52f346a20581'
)

package(){
  # Extract package data
  ar -x "${_pkgname}-${pkgver}_linux_amd64.deb"
  tar -xJ -f "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # Generate .desktop file
  gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="/opt/${_pkgname}/vutron %U"
  rm -f "${pkgdir}/usr/share/applications/vutron.desktop"
  install -Dm644 "${srcdir}/${_pkgname,,}.desktop" -t "${pkgdir}/usr/share/applications"

  # icons
  for icon in "${pkgdir}/usr/share/icons/hicolor"/*/apps/vutron.png; do
    mv "$icon" "$(dirname "$icon")/${_pkgname,,}.png"
  done
}
