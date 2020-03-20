pkgname=vesc_tool-git
pkgver=0.95
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('any')
url="https://vesc-project.com/"
license=('unknown')
groups=()
depends=("qt5-connectivity" "qt5-serialport" "qt5-quickcontrols2")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/vedderb/vesc_tool.git"
_gitname="vesc_tool"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  qmake -config release "CONFIG += release_lin build_original"
  make clean
  make
  rm -rf build/lin/obj
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin/
  cp build/lin/vesc_* $pkgdir/usr/bin/vesc_tool

}

# vim:set ts=2 sw=2 et:
