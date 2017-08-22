# Maintainer: Paul-Louis Ageneau <paul-louis removethis (at) ageneau (dot) org>
pkgname=teapotnet-git
pkgver=20151230
pkgrel=1
pkgdesc="Private and decentralized social network for file sharing and streaming"
arch=('i686' 'x86_64')
url="http://teapotnet.org/"
license=('AGPL3')
depends=('gnutls' 'nettle' 'argon2')
makedepends=('git')
provides=('teapotnet')
conflicts=('teapotnet')
install='teapotnet.install'
optdepends=()

_gitroot="https://github.com/paullouisageneau/Teapotnet.git"
_gitname="teapotnet"

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
  cd "$srcdir/$_gitname-build"
  make install prefix="/usr" DESTDIR="$pkgdir"
  mkdir -p "$pkgdir/var/lib/teapotnet"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  chmod 750 "$pkgdir/var/lib/teapotnet"
  cp "teapotnet.service" "$pkgdir/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
