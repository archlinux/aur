# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>

pkgname=gnome-shell-extension-blur-my-shell
_pkgbase=blur-my-shell
pkgver=43
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('unzip')
conflicts=('gnome-shell-extension-blur-my-shell-git')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('604f8c4d0caf798339a2b470ce774b24211ce2ac07ad3fa429be97584a995f97')

build() {
  cd "${_pkgbase}-${pkgver}"
  make pot build
  cd build && unzip *.zip
}

package() {
  cd "${_pkgbase}-${pkgver}/build"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  install -Dm644 -t "${_destdir}/components" components/*.js
  install -Dm644 -t "${_destdir}/conveniences" conveniences/*.js
  install -Dm644 -t "${_destdir}/dbus" dbus/*.{js,xml}
  install -Dm644 -t "${_destdir}/effects" effects/*.{js,glsl}
  install -Dm644 -t "${_destdir}/preferences" preferences/*.js
  install -Dm644 -t "${_destdir}/ui" ui/*.ui
  cp -r --no-preserve=ownership,mode icons "${_destdir}"

  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
