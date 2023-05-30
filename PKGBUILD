# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>
# Adapted from: Dan McGee <dan@archlinux.org>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.12
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible, statically linked to musl libc"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl') #we are static. The Arch libedit package has stopped to ship the static library :(
install=dash.install
source=("https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('a5d2347465c0bad09a2921ecb55fb4e7fe451d627ed43c1da82b92259b539857c7a7f153dfee73cea4befcbb34388bb3585845148631262dfe6dec87390f049c')
b2sums=('e0751946fa3b6d513901cc98f3f39a48013f624b9a8ffd699e849456604b856866bd6da268560e6ffa9ec5b91976930d830297031804fdcbab82a953720ee973')

prepare() {
  cd ${_pkgbase}-${pkgver}
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC="musl-gcc"
  export CFLAGS="$CFLAGS -Os"
  ./configure \
    --enable-static \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix=""  #\
#    --with-libedit # disabled libedit for now

  make V=1
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # license
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
 
