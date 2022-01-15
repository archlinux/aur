pkgname=grumpy-irc-git
_pkgname=grumpy-irc
pkgver=v1.0.0.alpha.r324.g8b486350
pkgrel=1
pkgdesc="Modern, yet oldschool IRC client with distributed core, written in C++"
arch=('i686' 'x86_64')
url="https://github.com/grumpy-irc/grumpy"
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia')
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
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
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
}
