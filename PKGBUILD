# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

_target=powerpc-wrs-vxworks
pkgname=${_target}-gdb
pkgver=7.11.1
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
sha512sums=('f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360')

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
