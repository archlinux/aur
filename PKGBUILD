# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=https-everywhere
_plugin_version=5.1.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("https://www.eff.org/files/https-everywhere-${_plugin_version}-eff.xpi")
noextract=("https://www.eff.org/files/https-everywhere-${_plugin_version}-eff.xpi")
sha256sums=('c138399a27bf64ef2649cfdc4bd1dd755cd503834d6db9a6a509fa62b95e77fd')

prepare() {
  cd "$srcdir"

  # Ugly hack, bsdtar does not extract the xpi properly...
  unzip -qqo https-everywhere-${_plugin_version}-eff.xpi
}

package() {
  cd "$srcdir"

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/${emid}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  rm "${dstdir}/https-everywhere-${_plugin_version}-eff.xpi"

  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;
}
