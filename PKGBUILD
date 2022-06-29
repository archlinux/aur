# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=17
pkgrel=1
# _pkgrev=
_commit=551fe663ba88d33cd10f1b4ea630eb7c8e55c89a
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
# source=("${url}/archive/Ext-v${pkgver}${_pkgrev}.tar.gz")
source=("Ext-v${pkgver}${_pkgrev}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('33d3b3e03f363024686ddc94a1c503a855495cbf77475b44a30b0dea0eb0ac21')

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
