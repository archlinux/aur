# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-mcu
pkgver=4.0.1.0
pkgrel=1
pkgdesc="Header files and linker scripts for MSP430 microcontrollers"
arch=('any')
url="http://www.ti.com/tool/msp430-gcc-opensource"
license=('custom')
options=('!strip' 'staticlibs' 'emptydirs')
source=(http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/4_00_01_00/exports/msp430-gcc-support-files.zip
        license)
sha256sums=('84c8571cc6eab96df04685d5bd5f7884a0617435826c79d4dd50b5723b1353d9'
            'cd344f1a8da5c24768fbcc3494ad12b9880a82097dfb5a4d63d2a52f2833cc38')


build() {
  cd "${srcdir}/msp430-gcc-support-files"
  # seems like TI fixed this, please report bugs if that is not the case
  # for f in *.ld; do
  #   echo -n "Modifying linker script ${f}... "
  #   sed -i \
  #     "s|(\.debug_line)|(\.debug_line \.debug_line\.\* \.debug_line_end)|g" \
  #     ${f} 
  #   [[ $? = "0" ]] && echo "ok" || echo "fail"
  # done
}

package() {
  cd "${srcdir}/msp430-gcc-support-files"
  
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
  install -m644 ../license "${pkgdir}/usr/share/licenses/msp430-elf-mcu"
}

# vim:set ts=2 sw=2 et:
