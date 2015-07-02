# Maintainer: Yang Bai <hamo.by@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at> gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=gocode-bin
pkgver=20150420
pkgrel=1
pkgdesc="An autocompletion/refactoring daemon for the Go programming language (binary only)"
arch=(i686 x86_64)
url="https://github.com/nsf/gocode"
license=('GPL')
depends=('go')
provides=('gocode')
conflicts=('gocode')
install=
makedepends=('git')
#optdepends=

_gitroot="https://github.com/nsf/gocode.git"
_gitname="gocode"

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
  if [ -z "GOROOT" ] ; then
    source /etc/profile.d/go.sh
  fi
  GOPATH=$srcdir go build -o gocode
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 gocode $pkgdir/usr/bin/gocode
}
