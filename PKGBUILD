# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

_target="powerpc-wrs-vxworks"
pkgname=${_target}-binutils
pkgver=2.28
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=('i686' 'x86_64')
url="http://sources.redhat.com/binutils"
license=('GPL')
depends=('binutils' 'wrs-vxworks-headers')
conflicts=('binutils-powerpc-wrs-vxworks')
provides=('binutils-powerpc-wrs-vxworks')
options=('!strip' '!libtool' '!zipman' '!buildflags' 'staticlibs')
source=(http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
sha512sums=('ede2e4e59a800260eea8c14eafbaee94e30abadafd5c419a3370f9f62213cf027d6400a1d4970b6958bd4d220e675dcd483a708107016e7abd5c99d7392ba8fd')

build() {
  cd "$srcdir/binutils-${pkgver}"

  find -name config.cache -exec rm {} \;
  source /etc/profile.d/wind_base.sh

  [ $NOEXTRACT -eq 1 ] || ./configure \
    --prefix=/usr \
    --target=${_target} \
    --with-sysroot=/usr/${_target} \
    --disable-multilib \
    --disable-nls \
    --enable-lto \
    --disable-libiberty-install \
    --enable-ld=default \
    --enable-gold \
    --enable-plugins

  make configure-host
  make
}

package() {
  cd "$srcdir/binutils-${pkgver}"

  make DESTDIR=$pkgdir install

  rm -r "$pkgdir"/usr/share/info
}
