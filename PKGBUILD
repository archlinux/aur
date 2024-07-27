# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=ecl-git
pkgver=24.5.10.r262.g4f0fed469
pkgrel=1
pkgdesc="Embeddable Common Lisp"
arch=('x86_64')
url="https://common-lisp.net/project/ecl/"
license=('LGPL')
depends=('bash' 'gmp')
makedepends=('texinfo')
provides=('common-lisp' 'cl-asdf')
options=('!makeflags')
source=("git+https://gitlab.com/embeddable-common-lisp/ecl.git")
sha256sums=('SKIP')

pkgver() {
  cd ecl
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ecl
  sed -i 's|-Wl,--rpath,~A|-Wl,--rpath,/usr/lib/ecl|' src/configure
  CFLAGS+=" -fcommon -ffat-lto-objects" \
  ./configure \
    --build=$CHOST \
    --prefix=/usr \
    --with-tcp \
    --with-serve-event \
    --with-clos-streams \
    --with-system-gmp \
    --without-x \
    --without-clx \
    --enable-threads \
    --enable-shared \
    --enable-boehm=included \

  make
}

package() {
  make -C ecl DESTDIR="$pkgdir" install
}
