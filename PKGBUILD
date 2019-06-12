# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.2.2
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=('any')
url="https://epics-controls.org"
license=('EPICS Open License')
groups=('epics')
depends=('readline' 'ncurses' 'clang' 'perl')
source=("https://github.com/epics-base/epics-base/archive/R${pkgver}.tar.gz")
md5sums=('2f222803cb62f90bc7832fb16d829646')

prepare() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  
  > configure/CONFIG_SITE.local

  # for a static build
  #printf "SHARED_LIBRARIES=NO\nSTATIC_BUILD=YES\n" >> configure/CONFIG_SITE.local
}

build() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  make
}

check() {
  cd "$srcdir/${pkgname}-R${pkgver}"

  make runtests
}

package() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  echo "FINAL_LOCATION=/usr" >> configure/CONFIG_SITE.local
  echo "INSTALL_LOCATION="${pkgdir}/usr"" >> configure/CONFIG_SITE.local
  make realclean  # TODO: figure out a way to do this where we don't build everything twice...
  make
  
  # figure out what architecture EPICS is installing for
  _ARCH=$(basename "$(find "$pkgdir/usr/bin/" -mindepth 1 -type d)")
  
  msg2 ${_ARCH}
  # link bins to where they belong
  pushd "${pkgdir}/usr/bin"
  cp --symbolic-link "${_ARCH}"/* .
  popd

  rm "$pkgdir/usr/include/link.h" # owned by glibc
}

