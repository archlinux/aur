# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop
pkgver=0.14.0
pkgrel=1
pkgdesc="Streaming torrent client."
arch=('i686' 'x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('gconf')
makedepends=('npm' 'git' 'zip')
conflicts=('webtorrent-desktop-git' 'webtorrent-desktop-bin')
source=("https://github.com/feross/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('63e2d8530ac69b0b5921177392ac6e1bc11093505a496a230c30f08d2f7bd462'
            '4eba7b17fd0cd90f77fc1a1005f74d8fcd93dac4f669d1b1abbf71734b5bafa6')

[ "$CARCH" = "i686" ]   && _platform=ia32
[ "$CARCH" = "x86_64" ] && _platform=x64

build() {
  cd "$pkgname-$pkgver"

  npm install
  npm run package -- linux --package=zip
}

package() {
  cd "$pkgname-$pkgver/dist"

  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-${_platform}" "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/WebTorrent" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/$pkgname-$pkgver/static/WebTorrent.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 "WebTorrent-linux-${_platform}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
