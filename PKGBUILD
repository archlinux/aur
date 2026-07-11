# Maintainer: Ryany Dwel <ryanydwel@gmail.com>
# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: xuhcc <xuhcc at cryptolab dot net>

pkgname=mermaid-cli-chrome
_pkgrootname=mermaid-cli
pkgver=11.16.0
pkgrel=1
options=(!strip !debug)
pkgdesc='Generate images from Mermaid files'
arch=(any)
url="https://github.com/mermaid-js/$_pkgrootname"
license=(MIT)
depends=(nodejs google-chrome)
conflicts=(mermaid-cli)
makedepends=(npm)
_archive="$_pkgrootname-$pkgver"
source=("https://registry.npmjs.org/@mermaid-js/$_pkgrootname/-/$_archive.tgz")
noextract=("$_archive.tgz")
sha256sums=('65d795191bf9ca6ca90a40a1ea30354a6a491e206674cafd4d9de62fe9075439')

package() {
  # https://github.com/mermaid-js/mermaid-cli/blob/master/docs/already-installed-chromium.md
  PUPPETEER_SKIP_DOWNLOAD=1 npm install -g --prefix "$pkgdir/usr" "$_archive.tgz"
  sed -i "s# headless: 'shell'# headless: 'shell', executablePath: '/usr/bin/google-chrome-stable'#" "${pkgdir}/usr/lib/node_modules/@mermaid-js/$_pkgrootname/src/index.js"

  find "$pkgdir" -name prebuilds -type d -exec rm --recursive {} +

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgrootname" "$pkgdir/usr/lib/node_modules/@mermaid-js/$_pkgrootname/LICENSE"
}
