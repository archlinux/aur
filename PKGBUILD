# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>

pkgname=gnome-shell-extension-blur-my-shell
_pkgbase=blur-my-shell
pkgver=38
pkgrel=2
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('unzip')
conflicts=('gnome-shell-extension-blur-my-shell-git')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c57897282a67050881f55b82f5af1930ad9c1463c2aeb0da34facd10e5817919')

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
