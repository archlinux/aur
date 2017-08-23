# Maintainer: Grey Christoforo <first name at last name dot net>
# Contributer: mickael9 <mickael9 at gmail dot com>

_number_of_bits=8
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=1.43
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for their PIC10/12/16/18 microcontroller families and their PIC14000 device"
arch=(i686 x86_64)
url=http://www.microchip.com/mplab/compilers
license=(custom)
depends_i688=(gcc-libs)
depends_x86_64=(lib32-gcc-libs)
makedepends=(sdx)
makedepends_x86_64=(lib32-tclkit)
makedepends_i686=(tclkit)

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
source=("http://ww1.microchip.com/downloads/en/DeviceDoc/xc${_number_of_bits}-v$pkgver-full-install-linux-installer.run" "bitrock-unpacker.tcl")

md5sums=('5c629a470036c73b91afe2dceafc5c75'
         '70dedba4c417f8c0bb07c32d19e9d197')
install=$pkgname.install

instdir="/opt/microchip/xc${_number_of_bits}/v${pkgver}"

PKGEXT='.pkg.tar'

build() {
  msg2 "Unpacking files from installer"
  ./bitrock-unpacker.tcl ./xc${_number_of_bits}-v$pkgver-full-install-linux-installer.run ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}${instdir}"
  mv unpacked.vfs/compiler/programfiles*/* "${pkgdir}${instdir}"
  mv unpacked.vfs/licensecomponent/LinuxLMBin/bin/{roam.lic,xclm} "${pkgdir}${instdir}/bin"
  sed -i "s/<xclm>/<xclm>\n\t<xclm:LicenseDirectory xclm:path=\"\/opt\/microchip\/xclm\/license\/\" \/>/" \
  unpacked.vfs/licensecomponent/LinuxLMBin/etc/xclm.conf
  mv unpacked.vfs/licensecomponent/LinuxLMBin/etc/xclm.conf "${pkgdir}${instdir}/etc"
  mv unpacked.vfs/licensecomponent/LinuxLMBin/docs/* "${pkgdir}${instdir}/docs"
  mv "${pkgdir}${instdir}"/*License.txt "${pkgdir}${instdir}/docs" 2>/dev/null || true

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export PATH=\"\$PATH\":'${instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT='${instdir}'" >> "$pkgdir/etc/profile.d/${pkgname}.sh"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${instdir}/docs/$(basename "${pkgdir}${instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
