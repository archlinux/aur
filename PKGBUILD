# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=https-everywhere
_plugin_version=3.5.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("https://www.eff.org/files/https-everywhere-${_plugin_version}.xpi"
        "fix-path-to-rulesets-db.patch")
noextract=("https://www.eff.org/files/https-everywhere-${_plugin_version}.xpi")
md5sums=('9c2efc5ab558623d62dfd2e228f7dabb'
         '09778b2f3d889b713e8fa95b85a7a46b')

prepare() {
  cd $srcdir

  # Ugly hack, bsdtar does not extract the xpi properly...
  unzip -qqo ../https-everywhere-${_plugin_version}.xpi

  # Patch imported from the Debian package xul-ext-https-everywhere
  # Use the system-wide path for the default rulesets database
  patch -uN ${srcdir}/chrome/content/code/HTTPSRules.js < ${srcdir}/fix-path-to-rulesets-db.patch
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
