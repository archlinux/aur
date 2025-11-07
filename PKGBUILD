pkgname=grumpy-irc-git
_pkgname=grumpy-irc
pkgver=v1.0.0.alpha.r327.ge39e71f
pkgrel=1
pkgdesc="Modern, yet oldschool IRC client with distributed core, written in C++"
arch=('i686' 'x86_64')
url="https://github.com/grumpy-irc/grumpy"
license=('LGPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia')
makedepends=('ninja' 'cmake' 'git')
conflicts=('grumpy-irc' 'libircclient')
provides=('grump-irc' 'libircclient')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "$_pkgname" 
  sed -i 's|cmake_minimum_required (VERSION 2.8.0)|cmake_minimum_required (VERSION 3.5.0)|' src/CMakeLists.txt
  git submodule update --init --recursive 
  ./configure --qt6
}
build() {

  cmake -B _build \
    -S "$_pkgname/src" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  ninja -C _build
}

package() {
  DESTDIR="$pkgdir" ninja -C _build install 
  install -Dm644 "$startdir/GrumpyIRC.desktop" -t "$pkgdir/usr/share/applications" 
}
