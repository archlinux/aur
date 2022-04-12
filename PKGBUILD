# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended-git
_pkgname=custom-hot-corners-extended
pkgver=15.fixed.r63.g14c0897
pkgrel=1
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions - git"
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-custom-hot-corners-extended')
conflicts=('gnome-shell-extension-custom-hot-corners-extended')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/Ext.v*//;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make all
}

package() {
  cd "${_pkgname}"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js
  for i in src/*
    do
      install -Dm644 -t "${_destdir}/${i}" ${i}/*
    done
  install -Dm644 -t "${_destdir}/resources" resources/*.gresource
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
