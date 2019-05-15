# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop
pkgver=0.20.0
pkgrel=3
pkgdesc="Streaming torrent client."
arch=('i686' 'x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('gconf' 'electron' 'libnotify')
makedepends=('npm')
conflicts=('webtorrent-desktop-git' 'webtorrent-desktop-bin')
options=(!strip)
source=("https://github.com/feross/${pkgname}/archive/v${pkgver}.tar.gz"
        "webtorrent-desktop"
        "${pkgname}.desktop"
        "traysupport.patch")
sha256sums=('2eec644337f2e8a47187c54d702491e3b4c1f1236dae48cb494c4e99ba0a9796'
            'c1a416dbaefa5da60d236af561d60b7ed86def1c3ee05b7090bc5586da72fb17'
            '6af365f47ca47b33cca65f62c3a662218ba38af7d3d52bb891ce3e73bbb60539'
            'dbeff65a109489ce8ce4e89d0b4ad3bc1768d03707bc1a0845db852049296deb')

[ "$CARCH" = "i686" ]   && _platform=ia32
[ "$CARCH" = "x86_64" ] && _platform=x64

prepare() {
  cd "$pkgname-$pkgver"

  sed -i '/"electron.*":/d' package.json
  patch -p1 -i "$srcdir/traysupport.patch"
  sed -i 's/app.makeSingleInstance(onAppOpen)/!app.requestSingleInstanceLock()/' src/main/index.js
}

build() {
  cd "$pkgname-$pkgver"

  npm install
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
