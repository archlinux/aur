# Maintainer: Gabriel Fornaeus <gf@hax0r.se>
_pkgname=gnome-colors-revival
pkgname=${_pkgname}-git
pkgver=v2.0.1.r3.gd42d496
pkgrel=1
pkgdesc="An attempt to try and consolidate all gnome-colors icons and themes into one package."
arch=('any')
url="https://github.com/Somasis/gnome-colors-revival"
license=('GPL')
groups=()
depends=('make' 'gtk-engine-murrine')
makedepends=('git')
source=(${pkgname}::git+https://github.com/Somasis/gnome-colors-revival#branch=master)
sha256sums=('SKIP') 

_gitname="https://github.com/Somasis/gnome-colors-revival"

pkgver() {
    cd "$pkgname"
      git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_pkgname" ]]; then
    cd "$_pkgname" && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitname $_pkgname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_pkgname-build"
  git clone "$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"

  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
