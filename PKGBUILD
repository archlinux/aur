# Maintainer: Grey Christoforo <first name at last name dot net>
# Contributer: mickael9 <mickael9 at gmail dot com>

_number_of_bits=8
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=2.10
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for their PIC10/12/16/18 microcontroller families and their PIC14000 device"
arch=(x86_64)
url=http://www.microchip.com/mplab/compilers
license=(custom)
depends=(lib32-gcc-libs)
makedepends=(sdx lib32-tclkit)

options=(!strip docs libtool emptydirs !zipman staticlibs )
source=("http://ww1.microchip.com/downloads/en/DeviceDoc/xc${_number_of_bits}-v${pkgver}-full-install-linux-installer.run" "bitrock-unpacker.tcl")

md5sums=('ca370f5dfb393c003fa179efa6081e40'
         '70dedba4c417f8c0bb07c32d19e9d197')
install=$pkgname.install

_instdir="opt/microchip/xc${_number_of_bits}/v${pkgver}"

PKGEXT='.pkg.tar'

build() {
  msg2 "Unpacking files from installer"
  ./bitrock-unpacker.tcl ./xc${_number_of_bits}-v${pkgver}-full-install-linux-installer.run ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}/${_instdir}"
  mkdir -p "${pkgdir}/${_instdir}/etc"
  mv unpacked.vfs/compiler/programfiles*/* "${pkgdir}/${_instdir}"
  mv unpacked.vfs/licensecomponent/LinuxLMBin/bin/{roam.lic,xclm} "${pkgdir}/${_instdir}/bin"
  sed -i "s/<xclm>/<xclm>\n\t<xclm:LicenseDirectory xclm:path=\"\/opt\/microchip\/xclm\/license\/\" \/>/" \
  unpacked.vfs/licensecomponent/LinuxLMBin/etc/xclm.conf
  mv unpacked.vfs/licensecomponent/LinuxLMBin/etc/xclm.conf "${pkgdir}/${_instdir}/etc"
  mv unpacked.vfs/licensecomponent/LinuxLMBin/docs/* "${pkgdir}/${_instdir}/docs"
  mv "${pkgdir}/${_instdir}"/*License.txt "${pkgdir}/${_instdir}/docs" 2>/dev/null || true

  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export PATH=\"\$PATH\":'/${_instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT='/${_instdir}'" >> "${pkgdir}/etc/profile.d/${pkgname}.sh"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/${_instdir}/docs/$(basename "${pkgdir}/${_instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
  chmod u+s "${pkgdir}/${_instdir}/bin/xclm"
  chmod +x "${pkgdir}/${_instdir}/pic/bin/clang"
}
