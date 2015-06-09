# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_gitname=vbump
_gitroot='https://github.com/pbrisbin/vbump'

pkgname="$_gitname-git"
pkgver=0.0.0
pkgrel=1
pkgdesc='Automatically bump package versions'
arch=('any')
url=$_gitroot
license=('MIT')
makedepends=('git')
source=("git://github.com/pbrisbin/$_gitname")
md5sums=('SKIP')

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
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
