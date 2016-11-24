# Maintainer: Mark Selshot <mirkerz at gmail>
pkgname=weighttp-git
pkgver=0.4
pkgrel=1
pkgdesc="Lightweight and small benchmarking
tool for webservers."
arch=('i686' 'x86_64')
url="https://redmine.lighttpd.net/projects/weighttp"
license=('MIT')
groups=()
depends=('libev' 'python2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot=git://git.lighttpd.net/weighttp
_gitname=weighttp

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
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 waf --destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
