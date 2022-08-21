# Maintainer: Robin Van den Broeck <robin dot broeck at gmail dot com>

pkgname=gnome-shell-extension-gnome-volume-mixer
_pkgname=gnome-volume-mixer
pkgver=11
pkgrel=2
pkgdesc="Gnome extension that adds volume sliders for every application emitting audio in the system menu."
arch=('any')
url="https://github.com/mymindstorm/gnome-volume-mixer"
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'nodejs' 'npm' 'zip' 'glib2')
_commit=1e6c949ef426ca93341f02fab38c5f41c39f81bf
source=("git+https://github.com/mymindstorm/gnome-volume-mixer.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"/${_pkgname}
}

build() {
  cd "${srcdir}"/${_pkgname}
  npm ci
  npm run build
}

package() {
  cd "${srcdir}"/${_pkgname}/dist
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js
  install -Dm644 -t "${_destdir}/schemas" schemas/gschemas.compiled
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml 
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../LICENSE
}


# vim:set ts=2 sw=2 et:
