# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.2.2
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=('any')
url="https://epics-controls.org"
license=('EPICS Open License')
makedepends=('perl')
depends=('readline')
source=("https://github.com/epics-base/epics-base/archive/R${pkgver}.tar.gz")
md5sums=('2f222803cb62f90bc7832fb16d829646')

prepare() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  echo "$(perl src/tools/EpicsHostArch.pl)" > EPICS_HOST_ARCH
  echo "${pkgdir}/usr" > INSTALL_LOCATION
  echo "${pkgdir}/usr/bin" > INSTALL_HOST_BIN
  echo "${pkgdir}/usr/lib" > INSTALL_HOST_LIB
}

build() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  EPICS_HOST_ARCH="$(cat EPICS_HOST_ARCH)"
  INSTALL_LOCATION="$(cat INSTALL_LOCATION)"
  INSTALL_HOST_BIN="$(cat INSTALL_HOST_BIN)"
  INSTALL_HOST_LIB="$(cat INSTALL_HOST_LIB)"
  make
}

check() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  EPICS_HOST_ARCH="$(cat EPICS_HOST_ARCH)"
  INSTALL_LOCATION="$(cat INSTALL_LOCATION)"
  INSTALL_HOST_BIN="$(cat INSTALL_HOST_BIN)"
  INSTALL_HOST_LIB="$(cat INSTALL_HOST_LIB)"

  make tapfiles
  make -s test-results
}

package() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  EPICS_HOST_ARCH="$(cat EPICS_HOST_ARCH)"
  INSTALL_LOCATION="$(cat INSTALL_LOCATION)"
  INSTALL_HOST_BIN="$(cat INSTALL_HOST_BIN)"
  INSTALL_HOST_LIB="$(cat INSTALL_HOST_LIB)"

  make INSTALL_LOCATION=${INSTALL_LOCATION} install
  mv "$pkgdir/usr/bin/$EPICS_HOST_ARCH/"* "$pkgdir/usr/bin/."
  rm -rf "$pkgdir/usr/bin/$EPICS_HOST_ARCH/"

  mv "$pkgdir/usr/lib/$EPICS_HOST_ARCH/"* "$pkgdir/usr/lib/."
  rm -rf "$pkgdir/usr/lib/$EPICS_HOST_ARCH/"

  rm "$pkgdir/usr/include/link.h" # owned by glibc
  
  #make INSTALL_LOCATION=${INSTALL_LOCATION} INSTALL_HOST_BIN=${INSTALL_HOST_BIN} INSTALL_HOST_LIB=${INSTALL_HOST_LIB} install
}

