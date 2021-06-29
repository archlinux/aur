# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=hawknl-git
pkgver=20110125
pkgrel=3
pkgdesc="An open source game oriented network API (git)"
arch=('i686' 'x86_64')
url="https://github.com/dfyx/HawkNL"
license=('LGPL')
depends=('glibc')
provides=('hawknl')
source=(git+https://github.com/dfyx/HawkNL.git hawknl.patch)
md5sums=('SKIP'
         '7dec01dc297e2a4d3c515f6747dc5c9a')

pkgver() {
  cd "${srcdir}/HawkNL"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/HawkNL"

  patch -Np2 --binary -i "${srcdir}/hawknl.patch"
  make -f makefile.linux \
    LIBDIR="$pkgdir"/usr/lib \
    INCDIR="$pkgdir"/usr/include \
    OPTFLAGS="-D_GNU_SOURCE -D_REENTRANT" 
}

package() {
  cd "$srcdir/HawkNL"
  mkdir -p "${pkgdir}"/usr/{lib,include}

  make -f makefile.linux \
    LIBDIR="$pkgdir"/usr/lib \
    INCDIR="$pkgdir"/usr/include \
    OPTFLAGS="-D_GNU_SOURCE -D_REENTRANT" \
    install
  install -Dm644 src/nlinternal.h "${pkgdir}/usr/include/nlinternal.h"
  install -Dm644 include/hawklib.h "${pkgdir}/usr/include/hawklib.h"
  install -Dm644 include/hawkthreads.h "${pkgdir}/usr/include/hawkthreads.h"
}
