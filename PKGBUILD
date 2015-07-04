# Maintainer: Scott Lawrence <bytbox@gmail.com>
pkgname=sloc-git
pkgver=20140117
pkgrel=1
pkgdesc="Simply counts source lines of code"
arch=('i686' 'x86_64')
url="http://bytbox.net/hacks/sloc"
license=('MIT')
depends=('go')
optdepends=('perl-datetime' 'perl-json' 'perl-switch' 'gnuplot')
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=http://git.bytbox.net/sloc
_gitname=sloc

build() {
  cd "$srcdir"
  msg2 "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg2 "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg2 "GIT checkout done or server timeout"
  msg2 "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  msg2 "Generating man page"
  cd "$srcdir/$_gitname-build"
  ./gen-man.sh

  msg2 "Building sloc"
  cd "$srcdir/$_gitname-build/sloc"
  go build -o sloc
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m755 sloc/sloc "${pkgdir}/usr/bin/sloc"
  install -D -m755 reposloc "${pkgdir}/usr/bin/reposloc"
  install -D -m644 reposloc.1 "${pkgdir}/usr/share/man/man1/reposloc.1"
}

# vim:set ts=2 sw=2 et:
