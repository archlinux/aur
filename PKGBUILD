# Maintainer: xomachine <xomachiner@gmail.com>
pkgname=termit-git
pkgver=termit.3.0.r1.g8d8fe55
pkgrel=1
pkgdesc="Terminal emulator based on VTE library with Lua scripting"
conflicts=("termit")
arch=('i686' 'x86_64')
url="https://github.com/nonstop/termit"
license=('GPL')
depends=("lua" "vte3")
makedepends=("git" "cmake>=2.4")
source=("termit::git+https://github.com/nonstop/termit.git")
md5sums=('SKIP')

pkgver() {
  _pkgname=$(echo $pkgname | sed -e 's/-git$//')
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/version\.//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  _pkgname=$(echo $pkgname | sed -e 's/-git$//')
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_C_FLAGS="-I/usr/include/vte-2.91" -DCMAKE_INSTALL_PREFIX=/usr .
  make
}
package ()
{
  _pkgname=$(echo $pkgname | sed -e 's/-git$//')
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
