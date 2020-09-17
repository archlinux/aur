#
# PKGBUILD for opencbm
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=opencbm
pkgver=0.4.99.99a
pkgrel=1
epoch=
_pkgname=OpenCBM
_pkgver=${pkgver}
pkgdesc="OpenCBM allows access to Commodore (C64) storage devices VIC 1540, 1541, 1570, 1571, or even 1581 floppy drive"
arch=('i686' 'x86_64')
#url="http://sourceforge.net/projects/opencbm/"
#url="http://opencbm.trikaliotis.net/"
url="https://github.com/OpenCBM/OpenCBM"
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
_srcdirname=${_pkgname}-${_pkgver}
source=("https://github.com/OpenCBM/${_pkgname}/archive/v${_pkgver}.tar.gz")
md5sums=('c67518fff6c8b3c62b46cb382b115053')

build_kernel_module=

#
#
#

prepare()
{
  cd "${srcdir}/${_srcdirname}"
  # kernel module: add includes to kernel module source
  sed -i '\!#include <asm/uaccess.h>!s!.*!&\n#include <linux/uaccess.h>\n#include <linux/sched/signal.h>!' opencbm/sys/linux/cbm_module.c
  # kernel module: Makefile is needed later
  sed -i '\!-rm -f Makefile!d' opencbm/sys/linux/LINUX/Makefile
}

build()
{
  cd "${srcdir}/${_srcdirname}"
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
  cd "${srcdir}/${_srcdirname}"
}

package()
{
  cd "${srcdir}/${_srcdirname}"
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
