# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_plugin_name=ghostery
pkgname=firefox-extension-$_plugin_name
pkgver=6.1
pkgrel=1
pkgdesc="Plugin for Firefox which detects and/or blocks website trackers"
arch=('any')
url="https://www.ghostery.com"
license=('custom')
depends=("firefox")
makedepends=("unzip")
source=("https://addons.mozilla.org/firefox/downloads/latest/9609/addon-9609-latest.xpi"
        "ghostery.license")
sha1sums=('3985e1ad67b2c6003bd0c97d482ef25691f586bb'
          'cf0f4f850554edfd907f07ce3a6451cbc5637e68')
noextract=('addon-9609-latest.xpi')

prepare() {
  mkdir -p "$srcdir/addon"
  cd "$srcdir/addon/"
  unzip -q ../addon-9609-latest.xpi
}

package() {
  cd "$srcdir/addon/"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -Dm644 "$srcdir/ghostery.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"

  find "$dstdir" -type f -exec chmod +r {} \;
}
