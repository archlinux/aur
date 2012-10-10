# Maintainer: Antoine Lubineau <antoine@lubignon.inf>

pkgname=bmdtools-git
pkgver=20121010
pkgrel=1
pkgdesc="Basic capture and play programs for Blackmagic Design Decklink"
arch=('i686' 'x86_64')
url="https://github.com/lu-zero/bmdtools"
license=('custom')
depends=('libav-git')
makedepends=('decklink-sdk' 'git')

_gitroot='git://github.com/lu-zero/bmdtools.git'
_gitname='bmdtools'

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

  sed -i 's|SDK_PATH=../../include|SDK_PATH=/usr/src/decklink-sdk|' Makefile
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  
  install -D bmdcapture "$pkgdir/usr/bin/bmdcapture"
  install -D bmdplay "$pkgdir/usr/bin/bmdplay"
  install -D bmdgenlock "$pkgdir/usr/bin/bmdgenlock"

  install -D -m 0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
