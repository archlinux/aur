# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle-git
pkgver=20171022
pkgrel=1
pkgdesc='Brewing assistant and beer recipe design'
arch=('any')
url='https://github.com/314r/joliebulle'
license=('GPL3')
depends=('python' 'python-pyqt5' 'qt5-webkit')
makedepends=('git')
provides=('joliebulle')
conflicts=('joliebulle')

_gitroot='git@github.com:314r/joliebulle.git'
_gitname='joliebulle'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname"
  fi

  msg "Git checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build/bin"
  ./gen-ui
}

package() {
  cd "$srcdir/$_gitname-build"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
