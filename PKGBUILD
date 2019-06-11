# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.2.2
pkgrel=2
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=('any')
url="https://epics-controls.org"
license=('EPICS Open License')
depends=('readline' 'ncurses' 'clang' 'perl')
source=("https://github.com/epics-base/epics-base/archive/R${pkgver}.tar.gz")
md5sums=('2f222803cb62f90bc7832fb16d829646')

prepare() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  
  cd configure

  echo "INSTALL_LOCATION=${pkgdir}/usr" >> CONFIG_SITE
  
  # for a static build
  printf "SHARED_LIBRARIES = NO\nSTATIC_BUILD = YES" >> CONFIG_SITE
  
  #echo "$(perl src/tools/EpicsHostArch.pl)" > EPICS_HOST_ARCH
  #echo "${pkgdir}/usr" > INSTALL_LOCATION
  #echo "YES" > STATIC

  #echo "$(perl src/tools/EpicsHostArch.pl)" > EPICS_HOST_ARCH 
  #echo "${pkgdir}/usr" > INSTALL_LOCATION
  #echo "YES" > STATIC

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

  make install
  mv "$pkgdir/usr/bin/$EPICS_HOST_ARCH/"* "$pkgdir/usr/bin/."
  rm -rf "$pkgdir/usr/bin/$EPICS_HOST_ARCH/"

  mv "$pkgdir/usr/lib/$EPICS_HOST_ARCH/"* "$pkgdir/usr/lib/."
  rm -rf "$pkgdir/usr/lib/$EPICS_HOST_ARCH/"

  rm "$pkgdir/usr/include/link.h" # owned by glibc
  
}

