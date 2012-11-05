# Maintainer: Vianney le Clément <vleclement AT gmail·com>
pkgname=pplatex-git
pkgver=20121105
pkgrel=1
pkgdesc="Pretty-Print LaTeX: A tool to reformat the output of latex and friends into readable messages"
arch=('i686' 'x86_64')
url="https://github.com/stefanhepp/pplatex"
license=('GPL3')
depends=('pcre' 'texlive-bin')
makedepends=('git' 'scons')

_gitroot=https://github.com/stefanhepp/pplatex.git
_gitname=pplatex

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

  scons
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 bin/pplatex "$pkgdir/usr/bin/pplatex"
  ln -s pplatex "$pkgdir/usr/bin/ppdflatex"
}

# vim:set ts=2 sw=2 et:
