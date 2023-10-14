# Maintainer:
# Contributor: Grey Christoforo <first name at last name dot net>
# Contributer: mickael9 <mickael9 at gmail dot com>

_number_of_bits=8
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=2.45
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for their PIC10/12/16/18 microcontroller families and their PIC14000 device"
arch=(x86_64)
url="https://www.microchip.com/mplab/compilers"
license=(custom)

depends=(gcc-libs)
makedepends=(bitrock-unpacker tclkit)

conflicts=(lib32-tclkit)

install=$pkgname.install

options=(!strip docs libtool emptydirs !zipman staticlibs )

_dl_url="https://ww1.microchip.com"
_dl_path="downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools"
_dl_file="xc${_number_of_bits}-v${pkgver}-full-install-linux-x64-installer.run"

source=(
  "$_dl_file"::"$_dl_url/$_dl_path/$_dl_file"
)
sha256sums=(
  '3a48acd8150be7807ef10738fb9f915bc30963b385ce25fb84d151df49e13656'
)

_instdir="opt/microchip/xc${_number_of_bits}/v${pkgver}"

build() {
  echo "Unpacking files from installer"
  bitrock-unpacker "./$_dl_file" ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}/${_instdir}"
  mkdir -p "${pkgdir}/${_instdir}/etc"
  mv unpacked.vfs/compiler/programfiles*/* "${pkgdir}/${_instdir}"
  mv unpacked.vfs/licensecomponent/LinuxLMBin/bin/{roam.lic,xclm} "${pkgdir}/${_instdir}/bin"
  sed -i "s/<xclm>/<xclm>\n\t<xclm:LicenseDirectory xclm:path=\"\/opt\/microchip\/xclm\/license\/\" \/>/" \
  unpacked.vfs/licensecomponent/LinuxLMBin/etc/xclm.conf
  mv unpacked.vfs/licensecomponent/LinuxLMBin/etc/xclm.conf "${pkgdir}/${_instdir}/etc"
  mv "${pkgdir}/${_instdir}"/*License.txt "${pkgdir}/${_instdir}/docs" 2>/dev/null || true

  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export PATH=\"\$PATH\":'/${_instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT='/${_instdir}'" >> "${pkgdir}/etc/profile.d/${pkgname}.sh"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/${_instdir}/docs/$(basename "${pkgdir}/${_instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod u+s "${pkgdir}/${_instdir}/bin/xclm"
  chmod +x "${pkgdir}/${_instdir}/pic/bin/clang"
}
