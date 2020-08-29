# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop
pkgver=0.24.0
pkgrel=1
pkgdesc="Streaming torrent client."
arch=('any')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('electron' 'libnotify')
makedepends=('git' 'npm')
conflicts=('webtorrent-desktop-git' 'webtorrent-desktop-bin')
options=(!strip)
source=("https://github.com/webtorrent/${pkgname}/archive/v${pkgver}.tar.gz"
        "webtorrent-desktop"
        "traysupport.patch")
sha256sums=('75338a3def65ca43db2c8c1e6043370dcb1a6a8e2809ffa70c5b90d21b350531'
            'c1a416dbaefa5da60d236af561d60b7ed86def1c3ee05b7090bc5586da72fb17'
            'dbeff65a109489ce8ce4e89d0b4ad3bc1768d03707bc1a0845db852049296deb')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i '/"\(electron.*\|appdmg\)":/d' package.json
  sed -i -e '/^Path=/d' -e "s#/opt/${pkgname}/WebTorrent#/usr/bin/${pkgname}#" static/linux/share/applications/${pkgname}.desktop
  patch -p1 -i "$srcdir/traysupport.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  npm install
  npm run build
  npm prune --production
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a build index.js node_modules package.json static "${pkgdir}/usr/lib/${pkgname}/"
  cp -a static/linux/share "${pkgdir}/usr/"

  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
