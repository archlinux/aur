#
# PKGBUILD for opencbm-git
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=opencbm-git
pkgver=r1249.19c0d53
pkgrel=1
epoch=
pkgdesc="OpenCBM allows access to Commodore (C64) storage devices VIC 1540, 1541, 1570, 1571, or even 1581 floppy drive"
arch=('i686' 'x86_64')
_pkgname=opencbm
_pkgver=trunk
url="http://sourceforge.net/projects/opencbm/"
license=('GPL2')
groups=()
depends=('ncurses' 'libusb' 'libusb-compat')
makedepends=('cc65')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=(git+http://git.code.sf.net/p/opencbm/code)
md5sums=('SKIP')

build_kernel_module=


pkgver() {
  cd "${srcdir}/code"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/code"
  # kernel module: add includes to kernel module source
  sed -i '\!#include <asm/uaccess.h>!s!.*!&\n#include <linux/uaccess.h>\n#include <linux/sched/signal.h>!' opencbm/sys/linux/cbm_module.c
  # kernel module: Makefile is needed later
  sed -i '\!-rm -f Makefile!d' opencbm/sys/linux/LINUX/Makefile
}

build() {
  cd "${srcdir}/code"
  CC65_HOME="/usr/share/cc65"
  export CC65_HOME
  #make -f LINUX/Makefile opencbm plugin
  make -f LINUX/Makefile opencbm plugin-xum1541 plugin-xu1541

  # kernel module: build (optional)
  if test "${build_kernel_module}" != ""; then
    make -f LINUX/Makefile plugin-xa1541
  fi
}

check() {
  cd "${srcdir}/code"
}

package() {
  cd "${srcdir}/code"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  make -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin-xum1541 install-plugin-xu1541
  mv "${pkgdir}/etc/opencbm.conf" "${pkgdir}/etc/opencbm.conf.sample"


  # kernel module: build (optional)
  if test "${build_kernel_module}" != ""; then
    make -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin-xa1541
    # kernel module: copy and compress
    cp -a "${pkgdir}/lib" "${pkgdir}/usr"
    gzip "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/char/cbm.ko"
    # kernel module: clean up left overs
    rm -rf "${pkgdir}/lib/modules"
    rmdir "${pkgdir}/lib"
  fi

  # clean up empty dirs
  rmdir "${pkgdir}/usr/share/info"
}

# EOF
