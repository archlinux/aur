# Maintainer: steabert <steabert.arch@runbox.com>
pkgname=qcachegrind-git
pkgver=20130302
pkgrel=1
pkgdesc="Visualization of Performance Profiling Data (Qt version)"
arch=('i686' 'x86_64')
url="http://kcachegrind.sourceforge.net"
license=('GPL')
groups=()
depends=('qt4')
makedepends=('gcc' 'make' 'pkg-config' 'git' 'qt4')
optdepends=('graphviz')
provides=('qcachegrind')
conflicts=('qcachegrind', 'qcachegrind-svn')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://anongit.kde.org/kcachegrind"
_gitname="kcachegrind"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake-qt4 ../$_gitname/qcg.pro
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m 755 -p qcachegrind/qcachegrind "$pkgdir/usr/bin/qcachegrind"
  install -D -m 755 -p cgview/cgview "$pkgdir/usr/bin/cgview"
}
