# Maintainer: chenus <lin.pyw@qq.com>
# Contributor: chenus <lin.pyw@qq.com>

pkgname=vutronmusic-bin
_pkgname=VutronMusic
pkgver=2.9.0
pkgrel=2
pkgdesc="高颜值的第三方网易云播放器，支持本地音乐播放、离线歌单、桌面歌词、Touch Bar歌词、Mac状态栏歌词显示"
arch=('x86_64')
url="https://github.com/stark81/VutronMusic"
license=('MIT')
depends=(
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
makedepends=(
  'gendesk'
)
source=(
  "${_pkgname}-${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/VutronMusic-${pkgver}_linux_amd64.deb"
)
sha256sums=(
  '8df58804b1694e096b4fa2ce395b0694278fca40ced8995baef41f810ee7c51d'
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
