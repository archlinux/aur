pkgname=attractmode-git
pkgver=20151104
pkgrel=1
pkgdesc="A MAME front-end"
arch=('i686' 'x86_64')
url="https://github.com/mickelson/attract"
license=('GPL')
depends=('sfml' 'openal' 'ffmpeg' 'fontconfig' 'libxinerama' 'libarchive')
makedepends=('git')
conflicts=('attractmode')

_gitroot='https://github.com/mickelson/attract.git'
_gitname='attract'

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
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mkdir $pkgdir/usr/share
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

