# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns:
#    * ${CARCH} should be used instead of 'i386', but in such case, ${CARCH} would be 'i686' and its Makefile can only handle 'x86_64' or 'i686'.
#    * /usr/lib/libinfinipath.so.4.0 has executable stack.  That's an upstream issue.

pkgname=infinipath-psm
_pkgname=psm
pkgver=3.3
_pkgver_subver=22
_pkgver_commit=g326b95a
pkgrel=2
pkgdesc='OpenFabrics Alliance Intel Performance Scaled Messaging library'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc' 'libutil-linux')
makedepends=('git')
# Latest more-official release at "https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open.tar.gz" is broken
source=("git+https://github.com/01org/${_pkgname}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/psm"
  # Latest more-official release at "https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open.tar.gz" is broken
  # This isn't a -git AUR package, so grab the latest known and tested commit, as of the last updating of PKGBUILD 
  git checkout 326b95a
}

build() {
  cd "${srcdir}/psm"
  # infinipath-psm doesn't use configure, just make.  And make without options fails.
  # And Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make arch="${CARCH}"
  elif [[ "${CARCH}" == 'i686' ]]; then
    make arch='i386'
  fi
}

package() {
  cd "${srcdir}/psm"
  # Again, Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  # Also note README specifies LIBDIR option is upper case, but it's lower case libdir
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make arch="${CARCH}" DESTDIR="${pkgdir}" libdir=/usr/lib install
  elif [[ "${CARCH}" == 'i686' ]]; then
    make arch='i386' DESTDIR="${pkgdir}" libdir=/usr/lib install
  fi
  
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
