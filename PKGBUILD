# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=c10t-git
pkgver=20120305
pkgrel=1
pkgdesc="The c10t mapper for Minecraft"
arch=('i686' 'x86_64')
url="http://toolchain.eu/project/c10t"
license=('GPL')
groups=()
depends=(libpng boost-libs freetype2)
makedepends=('boost' 'git' 'cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/udoprog/c10t.git"
_gitname="c10t-gitrepo"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
    git submodule init || exit 1
    git submodule update || exit 1
    cd "$srcdir"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  git submodule init || exit 1
  git submodule update || exit 1

  #
  # BUILD HERE
  #

  #./autogen.sh
  #./configure --prefix=/usr
  cmake . || return 1
  make c10t || return 1

  mkdir -p $pkgdir/usr/bin/ || return 1
  install -m755 c10t $pkgdir/usr/bin/ || return 1
} 
