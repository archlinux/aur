# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Pierre Dorbais <pierre at dorbais dot fr>

_plugin_name=bloody-vikings
pkgname=firefox-extension-${_plugin_name}
pkgver=0.5.10
pkgrel=1
pkgdesc="Simplifies the use of temporary e-mail addresses in order to protect your real address from spam."
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
license=('GPL3')
depends=('firefox')
makedepends=('unzip')
source=("https://addons.cdn.mozilla.net/user-media/addons/261959/bloody_vikings-${pkgver}-sm+fx.xpi")
noextract=("bloody_vikings-${pkgver}-sm+fx.xpi")
sha256sums=('e3fd0c1e6b7a807e18b5b3429b39c6fe35492326600bb8f7268aa34367c5eebf')

prepare(){
cd ${srcdir}
unzip -qqo bloody_vikings-${pkgver}-sm+fx.xpi # bsdtar don't work correctly with this file…
}

package() { 
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
  [ -n ${emid} ] || return 1
  install -d ${dstdir}
  cp -R * ${dstdir}
  rm ${dstdir}/*.xpi
  find ${pkgdir} -type d -exec chmod 0755 {} \;
  find ${pkgdir} -type f -exec chmod 0644 {} \;
}
