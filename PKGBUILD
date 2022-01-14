# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>
# Adapted from: Dan McGee <dan@archlinux.org>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.11.4
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
sha512sums=('6bfe9f4cd4c8d7f0ba0f71d6df1fb784b3a3960d4395f76604e46d21e13c16e504c0b73ee7e8113d64448d1db2c90f5dbcc19fd2a40b8a52d3e8f32ee3ad61ca')
b2sums=('a40aad5713d37209d1ad423d606e5dccf9b953628f140058a054dd126ffd09b09d2fba0799e5c34b00337ccfb8db8cc73071b4aecd176f68dbb572491e76e2e9')


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
 
