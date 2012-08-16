# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gti-git
pkgver=20120816
pkgrel=1
pkgdesc="A silly git launcher"
arch=('i686' 'x86_64')
url="http://r-wos.org/hacks/gti"
license=('custom')
makedepends=('git')
source=('LICENSE')
sha256sums=('131817f9197405ccbfed83ad13d85f8cebccfe53be11151625bdec3c9c014d0b')

_gitroot='https://github.com/rwos/gti.git'
_gitname='gti'

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

  make
}

package() {
  cd "$srcdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$_gitname-build"
  install -Dm755 gti "$pkgdir/usr/bin/gti"
}

# vim:set ts=2 sw=2 et:
