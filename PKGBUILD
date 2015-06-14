# Maintainer: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# $Id: PKGBUILD 84937 2010-07-05 17:46:04Z eric $
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=urjtag
pkgname=${_pkgname}-git
pkgver=r1789.7ba12da
pkgrel=1
pkgdesc="Enhanced, modern tool for communicating over JTAG with flash chips, CPUs,and many more"
arch=("i686" "x86_64")
url="http://urjtag.org/"
license=("GPL2" "LGPL2.1")
depends=('libftd2xx')
makedepends=('git' 'gcc' 'libftd2xx' 'flex' 'bison')
#makedepends=(svn gcc flex bison)
conflicts=('urjtag')
options=('!strip')
source=("$pkgname::git://git.code.sf.net/p/urjtag/git"
        'urjtag_libftd2xx.patch')
sha512sums=('SKIP'
            'c17acc473aa5c4ce849ee6404a6d17b80b9933c227fa5e33009188f2b8b51e0e2cb6778324b12aa3348ad34f8d083a8602439bdfe3ec6bb0959cb398bd8acdc9')

pkgver() {
  cd "$srcdir/$pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname/$_pkgname"
#  cd "$srcdir/$pkgname-$pkgver/trunk/urjtag"
#  if [ ! -f _patched ]; then
#    patch -p1 <../../urjtag_libftd2xx.patch
#    touch _patched
#  fi
  if [ ! -f ./configure ]; then
    ./autogen.sh
  fi
  ./configure --prefix=/usr
#  ./configure --prefix=/usr --without-ftd2xx
#  ./configure --prefix=/usr CFLAGS="-Wno-error=unused-but-set-variable"
  make
}

package() {
  cd "$srcdir/$pkgname/$_pkgname"
  make DESTDIR="$pkgdir" install
}

