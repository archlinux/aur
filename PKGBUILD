# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-extension-list-git
_pkgname=extension-list
pkgver=42+r1+ge93f73c
pkgrel=1
pkgdesc="A Simple GNOME Shell extension manager in the top panel - git"
arch=('any')
url="https://github.com/tuberry/extension-list"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-extension-list')
conflicts=('gnome-shell-extension-extension-list')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "${_pkgname}"
  make all
}

package() {
  cd "${_pkgname}"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" README.md "_build"/{metadata.json,*.js,*.css}
  install -Dm644 -t "${_destdir}/icons" "_build/icons"/*.svg
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" ${_uuid}/schemas/*gschema.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  if test -d "_build/locale"; then
    cd "_build/locale"
    for locale in */
      do
        install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
      done
  fi
}
