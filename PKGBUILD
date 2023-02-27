# Maintainer: Mingi Sung <fiestalake@disroot.org>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=26
pkgrel=1
# _pkgrev=
_commit=978ecfa0fed6843af654db1d9223a52bd315fc91
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
# source=("${url}/archive/Ext-v${pkgver}${_pkgrev}.tar.gz")
source=("Ext-v${pkgver}${_pkgrev}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b49ee87dba49473e167219dc7f4810f09b14abbc35d4b9b953898f30528af728')

build() {
  # cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
  cd "${_pkgname}-${_commit}"
  make all
}

package() {
  # cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
  cd "${_pkgname}-${_commit}"
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
