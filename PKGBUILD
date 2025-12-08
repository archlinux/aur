# Maintainer: Rafael Campos Las Heras <methril at gmail dot com>

pkgver=3.30
pkgname=microchip-mplabxc-dsc-bin
pkgrel=2
pkgdesc="Microchip's MPLAB XC-DSC C compiler toolchain for their dsPIC33A DSC microcontroller families"
arch=(x86_64)
url=http://www.microchip.com/xc-dsc
license=(custom)
#depends_i688=(gcc-libs)
#depends_x86_64=(lib32-gcc-libs)
makedepends=(bitrock-unpacker)

options=(!strip docs libtool emptydirs !zipman staticlibs)
source=("https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc-dsc-v$pkgver-full-install-linux64-installer.run")
sha256sums=('0df20c1a552bf0ce08aa139b9cb1efd71bf65b9d9f37e3982763f4f8738bfa11')
install=$pkgname.install

instdir="/opt/microchip/xc-dsc/v${pkgver}"

PKGEXT='.pkg.tar'

build() {
  msg2 "Unpacking files from installer"
  bitrock-unpacker ./xc-dsc-v$pkgver-full-install-linux64-installer.run ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}${instdir}"
  mv unpacked.vfs/compiler/programfiles*/* "${pkgdir}${instdir}"
  mv unpacked.vfs/licensecomponent/LinuxLM/xclmcheck.sh "${pkgdir}${instdir}/bin"
  mv unpacked.vfs/licensecomponent/xclmBinlinux32/bin/{roam.lic,xclm} "${pkgdir}${instdir}/bin"
  chmod u+s "${pkgdir}${instdir}/bin/xclm"
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
