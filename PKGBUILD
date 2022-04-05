# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_gitname=aur-release
_gitroot='https://github.com/pbrisbin/aur-release'

pkgname="$_gitname-git"
pkgver=1.0.1
pkgrel=2
pkgdesc='Automatically release aur packages'
arch=('any')
url=$_gitroot
license=('MIT')
makedepends=('git')
source=("git+https://github.com/pbrisbin/$_gitname")
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
