# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

_gitname=wpgtk
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=deviantfero # djmelik
pkgver=r96.ba82065
pkgrel=1
pkgdesc="A gui wallpaper chooser that changes your Openbox theme, GTK theme and Tint2 theme"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('BSD')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python2' 'python2-pillow' 'feh' 'python-gobject' 'gtk3' 'libxslt')
makedepends=('git')
optdepends=()
conflicts=("${_gitname}" 'nitrogen')
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_gitname}"
  echo '#!/bin/bash' > ./wpg
  echo "/usr/bin/wpgtk/src/wpg.py" >> ./wpg
  mkdir -p ${pkgdir}/usr/bin/wpgtk/py
  mkdir -p ${pkgdir}/usr/bin/wpgtk/src
  install -D -m755 ./py/* ${pkgdir}/usr/bin/wpgtk/py
  install -D -m755 ./src/* ${pkgdir}/usr/bin/wpgtk/src
  install -D -m775 ./wpcscript ${pkgdir}/usr/bin/wpcscript
  install -D -m775 ./wpg ${pkgdir}/usr/bin/wpg
  install -D -m755 ./functions ${pkgdir}/usr/bin/wpgtk/functions
  bash ./installaur.sh
  echo
  echo "Remember to add sh ~/.wallpapers/wp_init.sh"
  echo "to your startup programs"
  echo
  echo "To run just type wpg"
  echo
  sleep 3
}

# vim:set et sw=2 sts=2 tw=80:
