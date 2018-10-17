# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=infinipath-psm
_pkgname=psm
pkgver=3.3
_commit=604758e
pkgrel=5
pkgdesc='OpenFabrics Alliance Intel Performance Scaled Messaging library'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('glibc' 'libutil-linux')
makedepends=('git')
# Upstream is no longer releasing at "https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}_${_pkgver_commit}_open.tar.gz",
# and the latest release there from 2016 fails building on modern GCC.
# Other distributions are also using specific commits on github for new release versions tagged under 3.3.
source=("git+https://github.com/intel/${_pkgname}#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}/${_pkgname}"
  # infinipath-psm doesn't use configure, just make.  make without options fails.
  # Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make "arch=${CARCH}"
  elif [[ "${CARCH}" == 'i686' ]]; then
    make arch=i386
  else
    echo "Shouldn't be here, CARCH is '${CARCH}', but it needs to be 'x86_64' or 'i686'"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  # Again, Makefile looks for "arch" environment variable to be x86_64 or i386, which is not set by default on arch linux
  # Also note README specifies LIBDIR option is upper case, but it's lower case libdir
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make "arch=${CARCH}" DESTDIR="${pkgdir}" libdir=/usr/lib install
  elif [[ "${CARCH}" == 'i686' ]]; then
    make arch=i386 DESTDIR="${pkgdir}" libdir=/usr/lib install
  else
    echo "Shouldn't be here, CARCH is ${CARCH}, but it needs to be 'x86_64' or 'i686'"
    exit
  fi
  
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
}
