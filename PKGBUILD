# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: heaven <vo.zaeb at gmail.com>
# Contributor: Patrick Schwalm <patrick.schwalm@googlemail.com>

pkgname='libgcal-git'
pkgver=20111102
pkgrel=1
pkgdesc='ANSI C library that does allow communication with google calendar and contacts - Git Version'
url='http://code.google.com/p/libgcal/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libxml2' 'curl')
makedepends=('git' 'cmake')

conflicts=('libgcal')
provides=('libgcal')

source=()
md5sums=()

_gitroot='git://gitorious.org/libgcal/libgcal.git'
_gitname='libgcal'

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TESTS=Off -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}/" install
}
