# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Gary Hollis <ghollisjr@gmail.com>
pkgname=sbcl-git
pkgver=1.0
pkgrel=1
pkgdesc="SBCL from project GIT repo"
arch=(any)
url=""
license=('GPL')
groups=()
depends=(automake gcc sbcl)
makedepends=('git')
provides=(sbcl)
conflicts=(sbcl)
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://git.code.sf.net/p/sbcl/sbcl
_gitname=sbcl-sbcl

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
  sh make.sh
}

package() {
  cd "$srcdir/$_gitname-build"
  INSTALL_ROOT="$pkgdir/" ./install.sh
}

# vim:set ts=2 sw=2 et:
