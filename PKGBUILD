# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

_target=powerpc-wrs-vxworks
pkgname=${_target}-gdb
pkgver=7.12
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
sha512sums=('f610338b3a24dfb387c295431d806a0c1375e8ce51b8dd8bbfd2efc4612d0c0ed40ad4393508afca0071eca70688f62bc4f199da5e75ad16f64d91c3bc046033')

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
