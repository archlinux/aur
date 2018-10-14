# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns:
#    * ${CARCH} should be used instead of 'i386', but in such case, ${CARCH} would be 'i686' and its Makefile can only handle 'x86_64' or 'i686'.
#    * /usr/lib/libinfinipath.so.4.0 has executable stack.  That's an upstream issue.

pkgname=infinipath-psm
_pkgname=psm
pkgver=3.3
_pkgver_subver=22
_pkgver_commit=g326b95a
pkgrel=3
pkgdesc='OpenFabrics Alliance Intel Performance Scaled Messaging library'
arch=('x86_64')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc' 'libutil-linux')
makedepends=('git')
# Latest more-official release at "https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open.tar.gz" is broken
source=("git+https://github.com/intel/${_pkgname}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/psm"
  # Latest more-official release at "https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open.tar.gz" is broken
  # This isn't a -git AUR package, so grab the latest known and tested commit, as of the last updating of PKGBUILD 
  git checkout 326b95a

  # Upstream is incompatible with glibc 2.28
  # https://github.com/intel/psm/issues/25
  sed 's|#include <sys/types.h>|#include <sys/sysmacros.h>\n#include <sys/types.h>|g' -i ipath/ipath_proto.c

  # Upstream doesn't compile with newer GCC with -Werror
  # https://github.com/intel/psm/issues/26
  # NOTE: This gets it to compile, but this could point to an upstream bug
  sed 's|-Wall $(WERROR)|-Wall|g' -i buildflags.mak
  sed 's|-Wall -Werror|-Wall|g' -i psmd/Makefile
}

build() {
  cd "${srcdir}/psm"
  # infinipath-psm doesn't use configure, just make.  make without options fails.
  # Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  make arch=x86_64
}

package() {
  cd "${srcdir}/psm"
  # Again, Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  # Also note README specifies LIBDIR option is upper case, but it's lower case libdir
  make arch=x86_64 DESTDIR="${pkgdir}" libdir=/usr/lib install
  
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
