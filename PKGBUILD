# Maintainer: Michael Picht <mipi@fsfe.org>
pkgdesc="Gnome: Organize the items of the top (menu)bar"
_pkgname="top-bar-organizer"
pkgname="gnome-shell-extension-${_pkgname}"
pkgver=13
pkgrel=1
arch=(any)
url="https://gitlab.gnome.org/julianschacher/top-bar-organizer"
license=(GPL3)
source=("https://gitlab.gnome.org/julianschacher/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('76e198d2ff78496c2cf78cd505c10705')
makedepends=(
  git
  glib2
)
depends=(
  "gnome-shell>=1:45.0"
)
options=(
  !debug
)
build() {
  cd "${_pkgname}-v${pkgver}" || return
  glib-compile-schemas data/
}

package() {
  cd "${_pkgname}-v${pkgver}" || return

  # Retrieve extension name from metadata file and create target directory
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' src/metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  mkdir -p "$_destdir"

  # Copy relevant extension files to target directory
  cp -r src/* "${_destdir}/."
  cp -r data/{css,ui} "${_destdir}/."
  mkdir "${_destdir}/schemas"
  cp data/{*.xml,gschemas.compiled} "${_destdir}/schemas/."
}
