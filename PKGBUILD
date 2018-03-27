# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: domanov <domanov@gmail.com>
pkgname=reaktoro-git
pkgver=0.01
pkgrel=1
pkgdesc="An unified framework for modelling chemically reactive systems"
arch=('x86_64')
url="http://reaktoro.org/"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()

_gitroot=https://bitbucket.org/reaktoro/reaktoro.git
_gitname=reaktoro

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" && cd "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  #
  # BUILD HERE
  #
  msg "Starting build..."

  ## get rid of any "build" directory
  if [[ -d "$srcdir/$_gitname/build" ]]; then
     msg "Deleting previous build dir"
     rm -rf "$srcdir/$_gitname/build"
  fi   
  mkdir "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr/" ..
  make -j
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
