# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.2.2
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=('any')
url="https://epics-controls.org"
license=('EPICS Open License')
#makedepends=('rpcsvc-proto')
depends=('readline')
source=("https://github.com/epics-base/epics-base/archive/R${pkgver}.tar.gz")
md5sums=('2f222803cb62f90bc7832fb16d829646')

prepare() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  export EPICS_HOST_ARCH=`perl src/tools/EpicsHostArch.pl`
  export INSTALL_LOCATION="$pkgdir/usr"
  export INSTALL_HOST_BIN="${INSTALL_LOCATION}/bin"
  export INSTALL_HOST_LIB="${INSTALL_LOCATION}/lib"
}

build() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  make
}

check() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  make tapfiles
  make -s test-results
}

package() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  make INSTALL_LOCATION=${INSTALL_LOCATION} install

  mv "$pkgdir/usr/bin/$EPICS_HOST_ARCH/"* "$pkgdir/usr/bin/."
  rm -rf "$pkgdir/usr/bin/$EPICS_HOST_ARCH/"

  mv "$pkgdir/usr/lib/$EPICS_HOST_ARCH/"* "$pkgdir/usr/lib/."
  rm -rf "$pkgdir/usr/lib/$EPICS_HOST_ARCH/"

  rm "$pkgdir/usr/include/link.h" # owned by glibc
  
  #make INSTALL_LOCATION=${INSTALL_LOCATION} INSTALL_HOST_BIN=${INSTALL_HOST_BIN} INSTALL_HOST_LIB=${INSTALL_HOST_LIB} install
}

