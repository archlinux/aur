# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-retopoflow
pkgver=1.2.0
pkgrel=1
pkgdesc="A suite of retopology tools for Blender"
arch=('any')
url="https://cgcookiemarkets.com/all-products/retopoflow/"
license=('GPL')
groups=()
depends=('blender')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/CGCookie/retopoflow.git
_gitname=retopoflow

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
  git clone -b v1.2.0 "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/"
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
  if [ ! -d "$addons" ]; then
    mkdir -p "$addons"
  fi
  cp -a "$_gitname" "$addons/$_gitname"
  rm -fr "$addons/$_gitname/.git"*
}

# vim:set ts=2 sw=2 et:
