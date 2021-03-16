pkgname=wiringop-zero-git
_pkgbase=${pkgname%-*-*}
pkgver="32.a8f0526"
pkgrel=1
pkgdesc="WiringPi / WiringOP libary for the Orange Pi Zero with 26 pin GPIO header"
arch=('armv7h')
url="https://github.com/xpertsavenue/WiringOP-Zero"
license=('GPL3')
depends=()
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+${url}")
md5sums=('SKIP')

#====================================
pkgver() {
  cd ${srcdir}/WiringOP-Zero
  printf '%s' "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

#====================================
prepare() {
  cd ${srcdir}/WiringOP-Zero
  sed -i 's|ln -sf $(DESTDIR)$(PREFIX)/lib$(LIBARCH)/libwiringPiDev.so|ln -sf libwiringPiDev.so|g' ${srcdir}/WiringOP-Zero/devLib/Makefile
  sed -i 's|$(DESTDIR)/lib|$(DESTDIR)$(PREFIX)/lib|g' */Makefile
}

#====================================
package() {
  cd ${srcdir}/WiringOP-Zero

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib"
  install -dm755 "${pkgdir}/usr/include"

  msg2 "WiringPi Library"
  cd wiringPi
  make
  make DESTDIR="${pkgdir}" PREFIX="/usr" LDCONFIG=true install

  msg2 "WiringPi Devices Library"
  cp wiringPi.h    ../devLib/
  cp wiringPiSPI.h ../devLib/
  cp sn3218.h      ../devLib/
  cp mcp23s17.h    ../devLib/
  cd ../devLib
  make
  make DESTDIR="${pkgdir}" PREFIX="/usr" LDCONFIG=true install

  msg2 "GPIO Utility"
  cd ../gpio
  make DESTDIR="${pkgdir}" PREFIX="/usr"
  make DESTDIR="${pkgdir}" PREFIX="/usr" LDCONFIG=true install
}
