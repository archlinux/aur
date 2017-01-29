# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

_target=powerpc-wrs-vxworks
pkgname=${_target}-gdb
pkgver=7.12.1
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('wrs-vxworks-headers' 'xz' 'python')
conflicts=('gdb-powerpc-wrs-vxworks')
provides=('gdb-powerpc-wrs-vxworks')
options=('!strip' 'libtool' '!zipman' 'staticlibs')
source=(http://ftp.gnu.org/gnu/gdb/gdb-"${pkgver}".tar.xz)
sha512sums=('0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8')

build() {
  cd "${srcdir}/gdb-${pkgver}"

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure \
    --prefix=/usr \
    --target=${_target} \
    --disable-nls \
    --with-sysroot=/usr/${_target}
  make
}

package() {
  cd "${srcdir}/gdb-${pkgver}"

  make DESTDIR=${pkgdir} install

  rm -rv ${pkgdir}/usr/share/info
  rm -rv ${pkgdir}/usr/include
  rm -rv ${pkgdir}/usr/share/gdb
}
