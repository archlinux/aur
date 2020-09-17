#
# PKGBUILD for opencbm-git
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=opencbm-git
pkgver=r1436.7134118b
pkgrel=1
epoch=
pkgdesc="OpenCBM allows access to Commodore (C64) storage devices VIC 1540, 1541, 1570, 1571, or even 1581 floppy drive"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencbm/"
license=('GPL2')
groups=()
depends=('libusb')
makedepends=('git' 'cc65')
checkdepends=()
optdepends=('ncurses: enable interactive mode for cbmlinetester')
provides=('opencbm')
conflicts=()
replaces=()
backup=('etc/opencbm.conf')
options=()
install=
changelog=
noextract=()
_repodirname=OpenCBM
#source=(git+http://git.code.sf.net/p/opencbm/code)
source=(git+https://github.com/OpenCBM/OpenCBM.git)
md5sums=('SKIP')

build_kernel_module=

#
#
#

pkgver()
{
  cd "${srcdir}/${_repodirname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "${srcdir}/${_repodirname}"
  # kernel module: add includes to kernel module source
  sed -i '\!#include <asm/uaccess.h>!s!.*!&\n#include <linux/uaccess.h>\n#include <linux/sched/signal.h>!' opencbm/sys/linux/cbm_module.c
  # kernel module: Makefile is needed later
  sed -i '\!-rm -f Makefile!d' opencbm/sys/linux/LINUX/Makefile
}

build()
{
  cd "${srcdir}/${_repodirname}"
  CC65_HOME="/usr/share/cc65"
  export CC65_HOME
  #make -f LINUX/Makefile opencbm plugin
  make -f LINUX/Makefile opencbm plugin-xum1541 plugin-xu1541

  # kernel module: build (optional)
  if test "${build_kernel_module}" != ""; then
    make -f LINUX/Makefile plugin-xa1541
  fi
}

check()
{
  cd "${srcdir}/${_repodirname}"
}

package()
{
  cd "${srcdir}/${_repodirname}"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  make -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin-xum1541 install-plugin-xu1541
  mv "${pkgdir}/etc/opencbm.conf" "${pkgdir}/etc/opencbm.conf.sample"

  # Don't overwrite ld.so.conf
  rm -f ${pkgdir}/etc/ld.so.conf

  # Remove scary warning from /etc/opencbm.conf and don't install both /etc/opencbm.conf.d/ and opencbm_plugin_helper_tools at all
  ##sed -i "/^;.*/d" ${pkgdir}/etc/opencbm.conf
  ##rm -rf ${pkgdir}/etc/opencbm.conf.d/
  ##rm ${pkgdir}/usr/bin/opencbm_plugin_helper_tools

  # kernel module: build (optional)
  if test "${build_kernel_module}" != ""; then
    make -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin-xa1541
    # kernel module: copy and compress
    cp -a "${pkgdir}/lib" "${pkgdir}/usr"
    gzip "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/char/cbm.ko"
    # kernel module: clean up left overs
    rm -rf "${pkgdir}/lib/modules"
  fi

  # clean up empty dirs
  #rmdir "${pkgdir}/lib"
  #rmdir "${pkgdir}/usr/share/info"
  find "${pkgdir}" -type d -empty -delete
}

#
# EOF
#
