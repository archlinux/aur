# Maintainer: Daniel Nagy <danielnagy at gmx de>

_gitname=sds
pkgname=libsds-git
pkgver=34.d86a9b8
pkgrel=1
pkgdesc="Simple Dynamic Strings library for C"
arch=('x86_64' 'i686' )
url="https://github.com/antirez/sds/"
license=('BSD')
depends=("glibc")
makedepends=('git' 'cmake')
provides=( "$_gitname" )
conflicts=( "$_gitname" )
source=( "git+$url" )
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  echo -e "add_library (sds SHARED sds.c)\n\
          install ( TARGETS sds DESTINATION lib )\n\
          install ( FILES sds.h DESTINATION include )"  > CMakeLists.txt
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
