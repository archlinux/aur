# Contributor: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>

pkgname=msp430-jtag
pkgver=2.4
pkgrel=1
pkgdesc="Hardware access tools for the MSP430 processor including BSL, JTAG"
arch=('i686' 'x86_64')
url="http://mspgcc.sourceforge.net/"
license=('custom:python')
depends=('python2' 'msp430-libc')
makedepends=('cvs' 'msp430mcu')
options=(!emptydirs)
source=()
md5sums=()

_builddir=build
_cvsdir=cvs
_cvsroot=":pserver:anonymous@mspgcc.cvs.sourceforge.net:/cvsroot/mspgcc"

prepare() {
  rm -fr ${_builddir}
  mkdir -p ${_builddir} ${_cvsdir}

  msg "Checking out mspgcc cvs repos"

  cd ${_cvsdir}
  cvs -z3 -d${_cvsroot} co -P packaging
  cvs -z3 -d${_cvsroot} co -P python
  cvs -z3 -d${_cvsroot} co -P jtag

  msg "Building python tools"
  cd ..
  cp -af ${_cvsdir}/python ${_builddir}/python
  cd ${_builddir}/python
  sed -i 's/python/python2/g' makefile
}


package() {

  cd ${_builddir}/python

  python2 setup.py install --root=${pkgdir}

  install -Dm755 msp430-bsl.py       ${pkgdir}/usr/bin/msp430-bsl
  install -Dm755 msp430-jtag.py      ${pkgdir}/usr/bin/msp430-jtag
  install -Dm755 msp430-ram-usage.py ${pkgdir}/usr/bin/msp430-ram-usage
  install -Dm755 titext2ihex.py      ${pkgdir}/usr/bin/titext2ihex
  install -Dm755 ihex2titext.py      ${pkgdir}/usr/bin/ihex2titext

  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  msg "Building MSP430mspgcc/HIL"

  cp -af ${srcdir}/${_cvsdir}/jtag ${srcdir}/${_builddir}/jtag
  cd ${srcdir}/${_builddir}/jtag
  sed -i 's/python/python2/g' funclets/makefile
  #sed -i 's/<io.h>/<msp430.h>/g' funclets/*.S
  sed -i 's/<io.h>/<msp430x21x1.h>/g' funclets/*.S
  sed -i 's/OUTPUT_ARCH(msp:110)/OUTPUT_ARCH(msp430)/g' funclets/msp430xRAM.x
  make hardware_access
  make funclets
  make msp430

  _docdir=${pkgdir}/usr/share/doc/${pkgname}

  cd ${srcdir}/${_builddir}/jtag
  install -Dm755 hardware_access/libHIL.so ${pkgdir}/usr/lib/libHIL.so
  install -Dm755 msp430/libMSP430mspgcc.so ${pkgdir}/usr/lib/libMSP430mspgcc.so

  cd ${srcdir}/${_builddir}/jtag/msp430
  install -Dm644 README.txt ${_docdir}/libMSP430mspgcc.txt

  cd ${srcdir}/${_builddir}/jtag/hardware_access
  install -Dm644 README.txt ${_docdir}/libHIL.txt

  cd ${srcdir}/${_cvsdir}/packaging
  install -Dm644 README-msp430-jtag.txt ${_docdir}/README-msp430-jtag.txt

  rm -fr ${_builddir}

  sed -i 's|^#!.*/usr/bin/env.*python|#!/usr/bin/env python2|' \
    ${pkgdir}/usr/bin/* \
    $(find ${pkgdir} -name '*.py')
}

# vim:set ts=2 sw=2 et:
