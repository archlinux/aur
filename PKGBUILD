# Maintainer: otaj <jasek.ota at gmail dot com>

pkgname=gnome-shell-extension-todotxt
_pkgdir=todo-txt
pkgver=v30
pkgrel=1
pkgdesc="Todo.txt GUI for gnome-shell"
arch=('any')
url="https://gitlab.com/bartl/todo-txt-gnome-shell-extension"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'python' 'python-lxml' 'python-jsonschema' 'python-six' 'moreutils' 'glib2' 'jq')
source=("${_pkgdir}::git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${_pkgdir}"
  sed -ie 's|\.\.|https://gitlab.com/bartl|g' .gitmodules
  git submodule update --init --recursive
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
