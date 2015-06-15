# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=lib32-libunwind-git
pkgver=65ac867
pkgrel=1
pkgdesc="Portable and efficient C programming interface (API) to determine the call-chain of a program"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libunwind/"
license=('GPL')
makedepends=('git' 'texlive-core')
depends=('glibc' 'libunwind-git')
provides=('lib32-libunwind')
conflicts=('lib32-libunwind')

source=("${pkgname}::git+git://git.sv.gnu.org/libunwind.git")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  autoreconf -i
  CFLAGS="-m32 -U_FORTIFY_SOURCE" LDFLAGS="-m32" ./configure --prefix=/usr \
    --libdir=/usr/lib32 --target=i686-pc-linux-gnu
  make
}

check() {
  cd "$srcdir/$pkgname"
  PATH=/usr/bin:$PATH make check || return 0
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  find $pkgdir/usr/include/*.h -not -name "*x86*" -exec rm -f {} \;
}

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(git describe --long --always)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
