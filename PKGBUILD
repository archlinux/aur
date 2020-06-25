# Maintainer: otaj <jasek.ota at gmail dot com>

pkgname=gnome-shell-extension-todotxt-git
_pkgname="${pkgname%-*}"
_pkgdir=todo-txt
pkgver=v30.r9.g6ec0377
pkgrel=1
pkgdesc="Todo.txt GUI for gnome-shell. Git version"
arch=('any')
url="https://gitlab.com/bartl/todo-txt-gnome-shell-extension"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'python' 'python-lxml' 'python-jsonschema' 'python-six' 'moreutils' 'glib2' 'jq')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgdir}::git+${url}.git")
sha512sums=('SKIP')

prepare() {
  cd "${_pkgdir}"
  git submodule update --init --recursive
}

pkgver() {
  cd "${_pkgdir}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgdir}"
  python json2schema.py
  jq '.version="'${pkgver}'"' metadata.json | sponge metadata.json
  glib-compile-schemas schemas
}

package() {
  cd "${_pkgdir}"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  for f in `cat dist_files.lst` ; do 
    if [ ! -d $f ] ; then
      install -DTm 644 $f ${_destdir}/$f;
    fi  
  done 
}
