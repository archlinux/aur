# Maintainer: Rafael Campos Las Heras <methril at gmail dot com>
# Contributer: Grey Christoforo <first name at last name dot net>
# Contributer: mickael9 <mickael9 at gmail dot com>

_number_of_bits=16
pkgver=2.10
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for their dsPIC and PIC24 microcontroller families"
arch=(i686 x86_64)
url=http://www.microchip.com/xc${_number_of_bits}
license=(custom)
depends_i688=(gcc-libs)
depends_x86_64=(lib32-gcc-libs)
makedepends=(bitrock-unpacker)

options=(!strip docs libtool emptydirs !zipman staticlibs)
source=("https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc${_number_of_bits}-v$pkgver-full-install-linux64-installer.run")
sha256sums=('d64d5e7391ec862d4dd169361b6680b725f8960435121709b45eb1a4afe15dc8')
install=$pkgname.install

instdir="/opt/microchip/xc${_number_of_bits}/v${pkgver}"

PKGEXT='.pkg.tar'

build() {
  msg2 "Unpacking files from installer"
  bitrock-unpacker ./xc${_number_of_bits}-v$pkgver-full-install-linux64-installer.run ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}${instdir}"
  mv unpacked.vfs/compiler/programfiles*/* "${pkgdir}${instdir}"
  mv unpacked.vfs/licensecomponent/LinuxLM/xclmcheck.sh "${pkgdir}${instdir}/bin"
  mv unpacked.vfs/licensecomponent/xclmBinlinux32/bin/{roam.lic,xclm} "${pkgdir}${instdir}/bin"
  sed -i "s/<xclm>/<xclm>\n\t<xclm:LicenseDirectory xclm:path=\"\/opt\/microchip\/xclm\/license\/\" \/>/" unpacked.vfs/licensecomponent/xclmBinlinux32/etc/xclm.conf
  mv unpacked.vfs/licensecomponent/xclmBinlinux32/etc/xclm.conf "${pkgdir}${instdir}/etc"
  mv unpacked.vfs/licensecomponent/xclmallDocs/doc/* "${pkgdir}${instdir}/docs"

  mv "${pkgdir}${instdir}"/*License.txt "${pkgdir}${instdir}/docs" 2>/dev/null || true

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export PATH=\"\$PATH\":'${instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT='${instdir}'" >> "$pkgdir/etc/profile.d/${pkgname}.sh"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${instdir}/docs/$(basename "${pkgdir}${instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
