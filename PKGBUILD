# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=https-everywhere
_plugin_version=5.0.5
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("https://www.eff.org/files/https-everywhere-${_plugin_version}.xpi")
noextract=("https://www.eff.org/files/https-everywhere-${_plugin_version}.xpi")
sha256sums=('bb36f8bceae336467e3e1ed4071eab8269a986330a388c301422bf04d2acb51f')

prepare() {
  cd $srcdir

  # Ugly hack, bsdtar does not extract the xpi properly...
  unzip -qqo https-everywhere-${_plugin_version}.xpi
}

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/https-everywhere-${_plugin_version}.xpi
  chmod -R 755 $dstdir
}
