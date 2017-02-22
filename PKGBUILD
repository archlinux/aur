# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
_tiver=1.198
pkgname=${_target}-mcu
pkgver=5.0.0.0
pkgrel=2
pkgdesc="Header files and linker scripts for MSP430 microcontrollers"
arch=('any')
url="http://www.ti.com/tool/msp430-gcc-opensource"
license=('custom')
options=('!strip' 'staticlibs' 'emptydirs')
source=(http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/exports/msp430-gcc-support-files-${_tiver}.zip
        license)
sha256sums=('8d411d61eebf794d4f786f77c901223c931146ba2dfe2ae0798433c7ddb15137'
            'cd344f1a8da5c24768fbcc3494ad12b9880a82097dfb5a4d63d2a52f2833cc38')


# TI changed the directory things get placed into...
_extractdir=msp430-gcc-support-files/include

build() {
  cd "${srcdir}/${_extractdir}"
  # https://sourceware.org/bugzilla/show_bug.cgi?id=17940
  # some linker scripts are missing the necessary debug_line the linker expects
  # for f in *.ld; do
  #   echo -n "Modifying linker script ${f}... "
  #   sed -i \
  #     "s|(\.debug_line)|(\.debug_line \.debug_line\.\* \.debug_line_end)|g" \
  #     ${f} 
  #   [[ $? = "0" ]] && echo "ok" || echo "fail"
  # done
}

package() {
  cd "${srcdir}/${_extractdir}"
  
  # install linker scripts
  # binutils does weird stuff and does not look in lib/ldscripts
  install -dm755 "${pkgdir}/usr/${_target}/lib"
  for f in *.ld; do
    install -m644 ${f} "${pkgdir}/usr/${_target}/lib"
  done
  
  # install header files
  install -dm755 "${pkgdir}/usr/${_target}/include"
  for f in *.h; do
    install -m644 ${f} "${pkgdir}/usr/${_target}/include"
  done

  # copy license file
  install -dm755 "${pkgdir}/usr/share/licenses/msp430-elf-mcu"
  install -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/msp430-elf-mcu"
}

# vim:set ts=2 sw=2 et:
