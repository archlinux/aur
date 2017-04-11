# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop
pkgver=0.18.0
pkgrel=3
pkgdesc="Streaming torrent client."
arch=('i686' 'x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('gconf' 'electron')
makedepends=('npm')
conflicts=('webtorrent-desktop-git' 'webtorrent-desktop-bin')
options=(!strip)
source=("https://github.com/feross/${pkgname}/archive/v${pkgver}.tar.gz"
        "webtorrent-desktop"
        "${pkgname}.desktop")
sha256sums=('25b92aab9cc6d076715a12bdaeae950f6885da19d87948a6acf007ba246b9494'
            '4ebe403535a6552333f56e6087355c85fbb1904b06908d62127337c7c593135c'
            '6af365f47ca47b33cca65f62c3a662218ba38af7d3d52bb891ce3e73bbb60539')

[ "$CARCH" = "i686" ]   && _platform=ia32
[ "$CARCH" = "x86_64" ] && _platform=x64

prepare() {
  cd "$pkgname-$pkgver"

  sed -i '/"electron.*":/d' package.json
}

build() {
  cd "$pkgname-$pkgver"

  npm install
  npm dedupe
  npm run build
  npm prune --production
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a build index.js node_modules package.json static "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "static/WebTorrent.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
