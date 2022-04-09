# Maintainer: skrewball <jason at joickle dot com>
# Maintainer: Christian Brassat <christian.brassat at gmail dot com>

pkgname=gnome-shell-extension-arc-menu
_pkgbase=ArcMenu
pkgver=30
pkgrel=1
pkgdesc="Application Menu Extension for GNOME"
arch=('any')
url="https://gitlab.com/arcmenu/ArcMenu"
license=('GPL2')
depends=(
    'dconf'
    'gnome-shell-extensions>=42'
    'gnome-menus'
)
conflicts=('gnome-shell-extension-arc-menu-git')
source=("${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('b1df8163427e4833e8d34ecfc597427e1280c89997f231cadcfe9c496eed4f72')

build() {
  cd "${_pkgbase}-v${pkgver}"
  make mergepo \
    && make VERSION="${pkgver}" _build
}

package() {
  cd "${_pkgbase}-v${pkgver}/_build"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  cp -r --no-preserve=ownership,mode media "${_destdir}"
  cp -r --no-preserve=ownership,mode menulayouts "${_destdir}"
  cp -r --no-preserve=ownership,mode searchProviders "${_destdir}"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
