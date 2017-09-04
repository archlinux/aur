# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=dsremote-git
pkgver=0.35_1707091429
pkgrel=1
pkgdesc="DSRemote is a program to control and visualize your Rigol® DS6000 or DS1000Z series oscilloscope from
your Linux desktop via USB or LAN."
arch=('i686' 'x86_64')
url="http://www.teuniz.net/DSRemote/"
license=('GPLv3')
depends=('qt4')
makedepends=('git')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/Teuniz/DSRemote.git
_gitname=dsremote

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
  qmake
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
