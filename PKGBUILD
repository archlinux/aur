# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=user_agent_switcher
_plugin_version=0.7.3.1
_plugin_ext=""
pkgdesc="Firefox extension to switch the User Agent"
license=('GPLv3')

pkgname=firefox-extension-useragentswitcher
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="http://chrispederick.com/work/user-agent-switcher/"
depends=("firefox>=4")
source=("https://addons.mozilla.org/firefox/downloads/latest/59/addon-59-latest.xpi")
sha256sums=('1a81e4d9058d567600eecfa5732be9960cd33c12b9525f28d1e52cb1fe26422d')

prepare() {
  cd "$srcdir"
  mv "addon-59-latest.xpi" "${_plugin_name}-${pkgver}${_plugin_ext}.xpi"
  unzip -qqo "${_plugin_name}-${pkgver}${_plugin_ext}.xpi" -d "${_plugin_name}-${pkgver}"
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
    install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}${_plugin_ext}.xpi"
  fi

}
