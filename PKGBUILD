pkgname=psximager-git
pkgver=20161107
pkgrel=1
pkgdesc='Tools for dumping and mastering PlayStation 1 ("PSX") CD-ROM images'
url="https://github.com/cebix/psximager"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('boost' 'libcdio' 'vcdimager')
makedepends=('git')
conflicts=('psximager')

_gitroot='https://github.com/cebix/psximager.git'
_gitname='psximager'

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
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
