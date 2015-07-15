# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>
# Contributor: Leif Warner <abimelech@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=dvb-usb-rtl2832u-openpli
pkgver=20130918
pkgrel=3
pkgdesc="Linux module for the RTL2832U DVB-T USB2.0 device"
arch=('i686' 'x86_64')
url="http://openpli.org/forums/topic/20899-rtl2832u-chipset-support-proposal"
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
install="${pkgname}.install"
provides=('dvb-usb-rtl2832u')
source=('dvb-usb-rtl2832u.patch::https://github.com/Xtrend-Official/meta-xtrend/raw/master/recipes-bsp/linux/linux-etxx00/dvb-usb-rtl2832.patch'
        'Makefile'
        'dvb-usb-rtl28xxu.conf')
md5sums=('263f5060ff7ef969ecaad1494700230a'
         'b91ef30d49fc0e7d8e76b39c98cf3ff6'
         '063be4e255e010899574fc3cdec67120')
PKGEXT='.pkg.tar'

_extramodules="extramodules-$(uname -r | cut -f-2 -d.)-$(uname -r | cut -f3- -d-)"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
  cd "$srcdir"
  
  [[ -e build_dir ]] && rm -r build_dir
  mkdir  build_dir
  cd build_dir

  # Get the sources from OpenPLi kernel patch
  patch -p5 < "$srcdir/dvb-usb-rtl2832u.patch" &> /dev/null && return 1
  
  # Copy Makefile
  cp "$srcdir/Makefile" .
    
  ## Patches go here ##

  # Build module
  export KBUILD_SRC="/usr/lib/modules/${_kernver}/build"
  export KVER="${_kernver}"
  make
}

package() {
  install -D -m644 "${srcdir}/dvb-usb-rtl28xxu.conf" "${pkgdir}/etc/modprobe.d/dvb-usb-rtl28xxu.conf"
  install -D -m644 "${srcdir}/build_dir/dvb-usb-rtl2832u.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/dvb-usb-rtl2832u.ko"
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${install}"
} 
