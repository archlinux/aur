# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>
# Adapted from: Dan McGee <dan@archlinux.org>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.11.5
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible, statically linked to musl libc"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl' 'libedit') #we are static
install=dash.install
source=("https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('324e7971bb9ab93246e811600f59a059462abc4fefc48c7d53782b518d560f740ace95f41b5d8c215279c6084c1881ff8bbdaabee69fdae66c971d3e9bdce2d4')
b2sums=('f8ad8eacbb13ea00ecccde33d32ea5cd7527b7fbef5a4e11765925239de91d916184a3b9fff9757629512a76eed3ae5cc46f5cf588fc65bd82616b187cb9cd2e')

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
    --exec-prefix=""  \
    --with-libedit

  make V=1
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # license
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
 
