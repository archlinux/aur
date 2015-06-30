# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <dasimmet@gmail.com>
pkgname=contour-shuttle-git
pkgver=0.1
pkgrel=1
pkgdesc="a key input driver wrapper for the Contour-ShuttlePROv2, a Jog/Shutlle device designed for A/V editing"
arch=('x86' 'x86_64')
url="https://github.com/dasimmet"
license=('GPL')
groups=()
depends=('libxtst' 'bash')
makedepends=('make' 'git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/dasimmet
_gitname=ShuttlePRO

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
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/udev/rules.d
  make DESTDIR="$pkgdir/usr/" install
  cp "99-ShuttlePRO.rules" "$pkgdir/etc/udev/rules.d/"
  cp "example.shuttlerc" $pkgdir/etc/
}

# vim:set ts=2 sw=2 et:
