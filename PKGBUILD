# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

_plugin_name=foxyproxy
_plugin_version=4.6.5
_plugin_id=2464
_plugin_ext="-fx+sm+tb"
pkgdesc="FoxyProxy is an advanced proxy management tool that completely replaces Firefox's limited proxying capabilities."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=4
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/2464/foxyproxy_standard-${pkgver}${_plugin_ext}.xpi")
sha256sums=('b8109fc59ba13a58e9a7adb5263cacc923f158cd1480631fa27dda7c1b57f59a')

prepare() {
  cd "$srcdir"
  unzip -qqo "${_plugin_name}_standard-${pkgver}${_plugin_ext}.xpi" -d "${_plugin_name}-${pkgver}"
}

package() {
  cd "${srcdir}"

  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_plugin_name}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep '<em:unpack>true</em:unpack>' ${_plugin_name}-${pkgver}/install.rdf > /dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ${_plugin_name}-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 ${_plugin_name}_standard-${pkgver}${_plugin_ext}.xpi "${_extension_dest}${_plugin_ext}.xpi"
  fi
}
