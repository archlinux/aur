# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=xwpe
pkgname=("$_pkgname" wpe-common wpe)
pkgver=1.5.30a
pkgrel=3
pkgdesc='A Borland IDE-like text editor'
arch=('i686' 'x86_64')
url='http://www.identicalsoftware.com/xwpe'
license=('GPL2')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        'xwpe-1.5.30a-build.patch'
        'xwpe-1.5.30a-compile.patch')
sha256sums=('fce37a5dd3afd7102a73d187eda8b9d1ab88bf5db649f385b8cd13e72e0c7961'
            '325accd4bbc21149d2b1d0dece9032c2e784773826fdb33629a86d67f84f7425'
            'cce4914d44631e7e319edd219a4e54dd73f518730fd119999b0c689a450dfc1a')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix and improve build
  patch -p1 -i "${srcdir}/xwpe-1.5.30a-build.patch"
  patch -p1 -i "${srcdir}/xwpe-1.5.30a-compile.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" ./configure \
   --prefix=/usr \
   --libdir=/usr/share \
   --mandir=/usr/share/man
  make
}

package_wpe-common() {
pkgdesc='Common files for WPE'
  cd "xwpe-${pkgver}"
  make install_data DESTDIR="${pkgdir}"
  install -Dvm644 CHANGELOG README -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

package_wpe() {
pkgdesc='A Borland IDE-like text editor for the console'
depends=("wpe-common=${pkgver}" 'zlib' 'gpm' 'ncurses')
  cd "xwpe-${pkgver}"
  make install_wpe DESTDIR="${pkgdir}"
}

package_xwpe() {
pkgdesc='A Borland IDE-like text edit for X'
depends=("wpe-common=${pkgver}" 'libsm' 'libx11' 'libxau' 'libxdmcp')
  cd "xwpe-${pkgver}"
  make install_xwpe DESTDIR="${pkgdir}"
}
