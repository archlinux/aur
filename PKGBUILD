# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=gnome-shell-extension-improvedosk-git
_repo=improved-osk-gnome-ext
pkgver=r41.4989e9c
pkgrel=1
epoch=1
pkgdesc="Makes GNOME's onscreen keyboard more useable."
url='https://github.com/nick-shmyrev/improved-osk-gnome-ext'
license=('GPL3')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git')
depends=('gnome-shell')
optdepends=('ttf-symbola: Recommended font for symbols')
source=("git+${url}.git")
sha512sums=('SKIP')
_schemas="/usr/share/glib-2.0/schemas"

prepare() {
  sed -i "s|Me.dir.get_child(\"schemas\").get_path()|'${_schemas}'|" ${srcdir}/${_repo}/prefs.js
}

pkgver() {
  cd ${_repo}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_repo}
  local _uuid="$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)"
  local _destdir="/usr/share/gnome-shell/extensions/$_uuid"

  # Copy extension files into place.                                      
  install -d $pkgdir/{$_destdir,$_schemas}                                          
  install -m644 *.js* stylesheet.css $pkgdir/$_destdir/
  install -m644 schemas/*.xml $pkgdir/$_schemas/
}
