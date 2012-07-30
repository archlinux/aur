# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=collectd-graphite-git
pkgver=20120730
pkgrel=1
pkgdesc="collectd plugin for sending data to graphite"
arch=('any')
url="https://github.com/joemiller/collectd-graphite"
license=('APACHE')
depends=('collectd')
optdepends=('graphite-web: to display the graphs on this machine')
makedepends=('git' 'perl' 'make')
install=${pkgname}.install

_gitroot=https://github.com/joemiller/collectd-graphite.git
_gitname=collectd-graphite

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

  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$_gitname-build"
  make test
}

# vim:set ts=2 sw=2 et:
