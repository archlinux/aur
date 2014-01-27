# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=gpx-git
pkgver=r43.3570fc9
pkgrel=1
pkgdesc="Gcode to x3g conversion post processor"
arch=('x86' 'x86_64')
url="https://github.com/whpthomas/GPX"
license=('GPL')
makedepends=('git')
provides=('gpx')
conflicts=('gpx')

_gitroot=https://github.com/whpthomas/GPX
_gitname=GPX

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

  #
  # BUILD HERE
  #
  make 
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
