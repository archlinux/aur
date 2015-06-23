# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=bamtools-git
pkgver=20110606
pkgrel=1
pkgdesc="API and toolkit for reading, writing, and manipulating BAM (genome alignment) files."
arch=('i686' 'x86_64')
url="https://github.com/pezmaster31/bamtools"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=('bamtools')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/pezmaster31/bamtools.git"
_gitname="bamtools"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build
  pushd build
  cmake ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir "$pkgdir/usr"
  cp -r bin lib "$pkgdir/usr"

  mkdir -p "$pkgdir/usr/include/bamtools"
  cp -r include/* "$pkgdir/usr/include/bamtools"
} 
