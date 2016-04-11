# Maintainer: Anselm L. S. Melo <anselmolsm@gmail.com>
pkgname=git-hg-git
pkgver=r149.4a923a8
pkgrel=1
pkgdesc="A set of scripts for checking out and tracking a mercurial project from git. Push supported added as well although it is still experimental."
arch=('any')
url=""
license=('MIT')
groups=()
depends=('git' 'mercurial')
makedepends=('git')
provides=('git-hg')
source=()
noextract=()

_gitroot=git://github.com/cosmin/git-hg.git
_gitname=git-hg-git

pkgver() {
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    printf "1"
  fi
}

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

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
