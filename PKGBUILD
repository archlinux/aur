# Maintainer: Nick Østergaard <oe.nick at gmail.com>
pkgname=flyby-git
pkgver=r472.138d2e3
pkgrel=1
pkgdesc="A satellite tracking program"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/la1k/flyby"
license=('GPL')
makedepends=('git')
depends=('bash' 'libpredict-git')
provides=('flyby')
replaces=('flyby')
install=

_gitroot=https://github.com/la1k/flyby.git
_gitname=flyby

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cmake .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/etc/flyby
  cp -r default $pkgdir/etc/flyby
  mkdir -p $pkgdir/usr/bin
  cp flyby $pkgdir/usr/bin/
  cp update-tle $pkgdir/usr/bin/ # Bash needed for this script
}

# vim:set ts=2 sw=2 et:
