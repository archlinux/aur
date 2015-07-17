# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns:
#    * ${CARCH} should be used instead of 'i386', but in such case, ${CARCH} would be 'i686' and its Makefile can only handle 'x86_64' or 'i686'.
#    * /usr/lib/libinfinipath.so.4.0 has executable stack.  That's an upstream issue.

pkgname=infinipath-psm
pkgver=3.3
_pkgver_subver=2
_pkgver_commit=g6f42cdb
pkgrel=1
pkgdesc='OpenFabrics Alliance Intel Performance Scaled Messaging library'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc' 'libutil-linux')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open.tar.gz")
md5sums=('d52fc5711e23418c32beaf405b2ce6f6')

prepare() {
  # v3.3-2_g6f42cdb uses /usr/lib64 without a proper way to override it
  # Documentation claims make install supports LIBDIR=/lib overriding the default /lib64 for x86_64 architecture, but it doesn't
  cd "${srcdir}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open"
  sed -i 's|$(INSTALL_PREFIX)/lib64|$(INSTALL_PREFIX)/lib|' Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open"
  # infinipath-psm doesn't use configure, just make
  # And Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make arch="${CARCH}"
  elif [[ "${CARCH}" == 'i686' ]]; then
    make arch='i386'
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open"
  # Again, Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make arch="${CARCH}" DESTDIR="${pkgdir}" LIBDIR=/usr/lib install
  elif [[ "${CARCH}" == 'i686' ]]; then
    make arch='i386' DESTDIR="${pkgdir}" LIBDIR=/usr/lib install
  fi
  
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
