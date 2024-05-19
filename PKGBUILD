#
# PKGBUILD for opencbm
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=opencbm
pkgver=0.4.99.104
pkgrel=1
epoch=
pkgdesc="OpenCBM allows access to Commodore (C64) floppy drives 1540, 1541, 1570, 1571, 1581"
arch=('i686' 'x86_64')
url="https://github.com/OpenCBM/OpenCBM"
license=('GPL-2.0-only')
groups=()
depends=('libusb' 'ncurses')
makedepends=('git' 'cc65')
checkdepends=()
optdepends=()
provides=('opencbm')
conflicts=('opencbm')
replaces=()
backup=('etc/opencbm.conf')
options=()
install=
changelog=
noextract=()
_pkgname=OpenCBM
_pkgver=${pkgver}
_src_dirname=${_pkgname}-${_pkgver}
source=("opencbm.src.tgz::https://github.com/OpenCBM/${_pkgname}/archive/v${_pkgver}.tar.gz")
#        "nibtools.src.tgz::https://github.com/OpenCBM/nibtools/archive/refs/heads/master.tar.gz")
sha256sums=('5499cd1143b4a246d6d7e93b94efbdf31fda0269d939d227ee5bcc0406b5056a')
#            "a96022c26bc0dd175ca0428bc101c5d87bd891569953c06123d75244b775a466")

build_kernel_module=

#
#
#

prepare()
{
  cd "${srcdir}/${_src_dirname}"

  # nibtools
  # not in use - a separate nibtools package exists
  #rmdir opencbm/nibtools
  #ln -s ../../nibtools-master opencbm/nibtools
  # temp hack in order to compile nibtools
  #echo "CFLAGS+=-D_DEFAULT_SOURCE" >> opencbm/nibtools/GNU/Makefile

  # kernel module: add includes to kernel module source
  #sed -i '\!#include <asm/uaccess.h>!s!.*!&\n#include <linux/uaccess.h>\n#include <linux/sched/signal.h>!' opencbm/sys/linux/cbm_module.c
  # kernel module: Makefile is needed later
  sed -i '\!-rm -f Makefile!d' opencbm/sys/linux/LINUX/Makefile
}

build()
{
  cd "${srcdir}/${_src_dirname}"

  CC65_HOME="/usr/share/cc65"
  export CC65_HOME

  #make -s -w -f LINUX/Makefile opencbm plugin
  make -s -w -f LINUX/Makefile opencbm plugin-xum1541 plugin-xu1541

  # kernel module: build (optional)
  if test "x${build_kernel_module}" != "x"; then
    make -s -w -f LINUX/Makefile plugin-xa1541
  fi
}

check()
{
  cd "${srcdir}/${_src_dirname}"
}

package()
{
  cd "${srcdir}/${_src_dirname}"

  mkdir -p "${pkgdir}/etc/udev/rules.d"

  make -s -w -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin-xum1541 install-plugin-xu1541

  mv "${pkgdir}/etc/opencbm.conf" "${pkgdir}/etc/opencbm.conf.sample"

  # Don't overwrite ld.so.conf
  rm -f ${pkgdir}/etc/ld.so.conf

  # Remove scary warning from /etc/opencbm.conf and don't install both /etc/opencbm.conf.d/ and opencbm_plugin_helper_tools at all
  ##sed -i "/^;.*/d" ${pkgdir}/etc/opencbm.conf
  ##rm -rf ${pkgdir}/etc/opencbm.conf.d/
  ##rm ${pkgdir}/usr/bin/opencbm_plugin_helper_tools

  # kernel module: build (optional)
  if test "x${build_kernel_module}" != "x"; then
    make -s -w -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin-xa1541
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
