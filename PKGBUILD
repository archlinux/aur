# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=sequencer64-git
pkgver=r233.c14ba05
pkgrel=1
pkgdesc="Minimal loop based midi sequencer. A more object-oriented successor to Sequencer24/Seq24, with many additional features, and more planned."
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/sequencer64"
license=('GPL')
depends=('gtkmm' 'libsigc++' 'jack' 'atk')
makedepends=('git' 'doxygen' 'texlive-bin')
provides=(sequencer64)
conflicts=()

_gitroot=https://github.com/ahlstromcj
_gitname=sequencer64

pkgver() {
#  cd "$pkgname"
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  ./bootstrap
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$_gitname-build"
  make install prefix="$pkgdir/usr"
  }

