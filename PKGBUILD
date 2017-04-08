# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=whatwg-html-git
pkgver=latest
pkgrel=1
pkgdesc="Clone the WHATWG HTML specification with local resources"
arch=('any')
url="https://whatwg.org/"
license=('GPL')
makedepends=(git perl)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(git+https://www.github.com/simonaw/whatwg-html.git)
noextract=()
md5sums=('SKIP')

_gitroot=https://www.github.com/simonaw/whatwg-html.git
_gitname=whatwg-html

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

  ./run
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p ${pkgdir}/usr/share/doc/whatwg
  cp -rv html-build/output/multipage ${pkgdir}/usr/share/doc/whatwg/html
}

# vim:set ts=2 sw=2 et:
