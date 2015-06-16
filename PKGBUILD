# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Robin Martinjak <rob@rmartinjak.de>
pkgname=correcthorse-git
pkgver=20120609
pkgrel=1
pkgdesc="Passphrase generator based on http://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
makedepends=('git')
provides=('correcthorse')
conflicts=('correcthorse')

_gitroot=https://github.com/rmartinjak/correcthorse.git
_gitname=correcthorse

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname" && git archive --format=tar --prefix="$_gitname-build/" HEAD | (cd "$srcdir/" && tar xf -)

  cd "$srcdir/$_gitname-build"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
