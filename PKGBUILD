# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=https-everywhere
_plugin_version=5.1.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=3
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("https://addons.cdn.mozilla.net/user-media/addons/229918/https_everywhere-5.1.1-sm+tb+fx+an.xpi")
noextract=("https_everywhere-${_plugin_version}-sm+tb+fx+an.xpi")
sha256sums=('d79e6c3bebdf5671e77c6c0e62b568d2b3c52aa60be072851b23172dc2be0211')

prepare() {
  cd "$srcdir"

  # Ugly hack, bsdtar does not extract the xpi properly...
  unzip -qqo "https_everywhere-${_plugin_version}-sm+tb+fx+an.xpi"
}

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
