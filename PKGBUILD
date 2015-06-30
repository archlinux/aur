# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <dasimmet@gmail.com>
pkgname=ttsdecker
pkgver=0.1
pkgrel=1
pkgdesc="Deck building Tool for Tabletop Simulator"
arch=('x86' 'x86_64')
url="https://github.com/Splizard"
license=('GPL')
groups=()
depends=('bash')
makedepends=('git' 'go')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/Splizard/
_gitname=decker

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"/"$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  #./autogen.sh
  #./configure --prefix=/usr
	go build -o ./decker ./src
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/mime/packages/
  mkdir -p $pkgdir/usr/share/pixmaps/
  cd "$srcdir/$_gitname-build"
	cp ./decker $pkgdir/usr/bin/decker
	cp ./misc/decker.desktop $pkgdir/usr/share/applications/
	cp ./misc/mime.xml $pkgdir/usr/share/mime/packages/
	cp ./misc/icon.png $pkgdir/usr/share/pixmaps/decker.png
}

# vim:set ts=2 sw=2 et:
