# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=soletta-git
pkgver=20150901
pkgrel=2
pkgdesc="Soletta Project is a framework for making IoT devices"
arch=('any')
url="http://github.com/solettaproject/soletta"
license=('custom:BSD3')
depends=()
makedepends=('git' 'python>=3.4' 'python-jsonschema' 'chrpath')
optdepends=('gtk3' 'icu' 'curl' 'systemd')
conflicts=('soletta')

_gitroot="git://github.com/solettaproject/soletta.git"   
_gitname=$pkgname

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

  git submodule init
  git submodule update
  make alldefconfig
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

#vim:set ts=2 sw=2 et:
