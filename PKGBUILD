# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=u2f-support
_plugin_version=1.0.1
pkgdesc="Add Universal 2Factory support, i.e. HW tokens to firefox"
license=('LGPL')
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/u2f-support-add-on/?src=api"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/664784/u2f_support_add_on-${pkgver}-fx-linux.xpi")
sha256sums=('acb0a405713f0f2cc2e9753c98050a2b23d0717f1ece9fef0fa36f993143b214')

package() {
  cd "${srcdir}"

  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep '<em:unpack>true</em:unpack>' install.rdf > /dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ./* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    echo "marker"
    install -Dm644 ${_plugin_name}-${pkgver}-fx.xpi "${_extension_dest}.xpi"
  fi

}
