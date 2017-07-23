# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>
# Contributor: Leif Warner <abimelech@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=dvb-usb-rtl2832u-openpli
pkgver=20130918
pkgrel=6
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
        'dvb-usb-rtl28xxu.conf'
        'linux42.patch'
        'rtl2832-get-parameters.patch')
sha256sums=('afbf84c73d6fb6d7b825b119a589f5213b0ad8f4c65527e10cf14f9d3286edb3'
            'ec571993780f47343dc42daa711b8f85a650e93f34be08c53699c3719cefb879'
            '200cc2ff29afb55c821d9df1b43de3af241a00eaef9796df0b4f36defc96f265'
            'd31cde94d74a517050c9c34449a4ad47f347e55b9f7fb06d7e755732bfcf3132'
            '6c04c4bba1f8aec94509c702c6d89b45509311127e6bc68147d1b2653de95f0a')

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
  patch -p1 < "$srcdir/linux42.patch"
  patch -p1 < "$srcdir/rtl2832-get-parameters.patch"

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
