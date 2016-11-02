# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=oktopi-git
pkgver=r1.9895a4b
pkgrel=2
pkgdesc='A fork of Pacman’s GUI Octopi for Chakra.'
arch=('i686' 'x86_64')
url='http://gitorious.org/chakra/oktopi'
license=('GPL')
depends=(kdebase-runtime)
makedepends=(git kdelibs cmake automoc4)
provides=(oktopi)
conflicts=(oktopi)
source=(oktopi.desktop)
sha512sums=('2ab11ce0feff00e81a4e9090e159a8458ab2bc86d5d9b33874c8838765b8b219f32df6e156ac968f9e020741a6ca22452eed8449565b31f0a0bbbb7f44650e20')
_gitroot='http://gitorious.org/chakra/oktopi.git'
_gitname='oktopi'

pkgver(){
  cd "$srcdir"
  if [[ ! -d "$_gitname" ]]; then
    git clone --depth 1 "$_gitroot" "$_gitname"
  fi

  cd "$srcdir"/$_gitname
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
build(){
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  [ ! -d build ] && mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release
  make
}
package(){
  cd "$srcdir"/$_gitname-build/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 $srcdir/oktopi.desktop $pkgdir/usr/share/applications/oktopi.desktop
  install -Dm644 ../resources/images/oktopi_yellow.png \
    $pkgdir/usr/share/icons/hicolor/64x64/apps/oktopi.png
}
