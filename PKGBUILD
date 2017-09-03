# Maintainer: Juri Grabowski <arch-dablin-maint@jugra.de>
pkgbase=dablin
pkgname=dablin-git
pkgver=1.5.0.r0.g6c576a8
pkgrel=1
pkgdesc="plays a DAB/DAB+ audio service – either from a received live transmission or from ETI files."
arch=('x86_64')
url="https://github.com/Opendigitalradio/dablin"
license=('GPL')
groups=()
depends=('sdl2' 'mpg123' 'gtkmm3' 'faad2' 'fdkaac' 'libfdk-aac')
makedepends=('pkg-config' 'git' 'cmake')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot=https://github.com/Opendigitalradio/dablin
_gitname=dablin

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

  #
  # BUILD HERE
  #
  mkdir ./build
  cd ./build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_gitname-build"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
