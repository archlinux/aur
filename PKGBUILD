# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
# Contributor: Christian Schendel <doppelhelix at gmail dot com>

# shellcheck disable=SC2034
_ext="applications-overview-tooltip"
pkgname="gnome-shell-extension-${_ext}"
pkgver=16
pkgrel=1
pkgdesc="Shows a tooltip over applications icons on applications overview"
arch=(any)
_author_ns="RaphaelRochet"
url="https://github.com/${_author_ns}/${_ext}"
install=${pkgname}.install
license=('GPL')
depends=('gnome-shell>=43')
makedepends=('glib2')
_url="https://extensions.gnome.org/extension-data/${_ext}${_author_ns}.v${pkgver}.shell-extension.zip"
source=("${pkgname}-${pkgver}.zip::${_url}")
sha256sums=('961343384b70c922339664493d7cc6c9736c56639dfbeebf6bd02d3c9eb46f51')

# shellcheck disable=SC2154
package() {
  cd "${srcdir}" || exit
  local uuid
  uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema
  schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled)$" -exec\
     install -Dm 644 {} "${destdir}"/{} \;
  install -Dm644 "${srcdir}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}
