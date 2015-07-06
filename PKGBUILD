# Maintainer: melchips <truphemus dot francois at gmail dot com>
pkgname="mopag-git"
pkgver=20121101
pkgrel=1
pkgdesc="Small pager for monsterwm which displays the number of desktops and number of windows on each desktop in a thin bar (last git pull)"
arch=("i686" "x86_64")
url="https://github.com/c00kiemon5ter/mopag"
license=('unknown')
groups=()
depends=("libx11")
makedepends=("git")
optdepends=()
provides=("mopag")
conflicts=("mopag")
source=()
md5sums=()

_gitroot='git://github.com/c00kiemon5ter/mopag.git'
_gitname='mopag'

build() {
  # update the repo, else clone a new one
  if [ -d $_gitname ] ; then
      pushd $_gitname
      git pull origin
      popd
      msg 'The local files are updated.'
  else
      git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'

  [ -d build ] && rm -rf build
  cp -r $_gitname build
  cd build

  # add the correct settings to Makefile
  sed -e "s|^\(\s*PREFIX ?=\).*|\1 /usr|" -i Makefile

  msg "Starting build process."
  make || return 1
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
