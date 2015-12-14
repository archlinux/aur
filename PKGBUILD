# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Dennis Craven <dcraven@gmail.com>
# Maintainer: CRT <cirkit@koderoot.net>

pkgname=ctw
pkgver=0.6
pkgrel=2
_branch=master
pkgdesc="An ncurses client for retrieving weather forecasts"
arch=('any')
url="https://github.com/tdy/ctw/"
license=('GPL')
makedepends=('git')
depends=('ncurses' 'python3')
source=('git+https://github.com/tdy/ctw.git') 
sha256sums=('SKIP')

_gitroot=https://github.com/tdy/ctw.git
_gitname=ctw

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
  python3 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname" 
  install -m644 weatherfeed.py "$pkgdir/usr/lib/python3.5/"
}

# vim:set ts=2 sw=2 et:
