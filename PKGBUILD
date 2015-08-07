# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=shellinabox-git
pkgver=2.14
pkgrel=1
pkgdesc=""
arch=('any')
url="https://code.google.com/p/shellinabox/"
license=('GPL2')
groups=()
depends=()
makedepends=('git' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=$url
_gitname=shellinabox

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" 
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/}"
  ./configure  --disable-login --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
