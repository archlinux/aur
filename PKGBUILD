# Maintainer: Rex McKinnon <0xFF at rexploits dot com>
# Contributor: xiota
# Contributor: Grey Christoforo <first name at last name dot net>
# Contributer: mickael9 <mickael9 at gmail dot com>

_number_of_bits=8
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=3.10
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for their PIC10/12/16/18 microcontroller families and their PIC14000 device"
url="https://www.microchip.com/mplab/compilers"
license=('LicenseRef-MPLAB-XC-Unified')
arch=('x86_64')

depends=(gcc-libs)
makedepends=(bitrock-unpacker tclkit)

conflicts=(lib32-tclkit)

install=$pkgname.install

options=(!strip docs libtool emptydirs !zipman staticlibs)

_dl_url="https://ww1.microchip.com"
_dl_path="downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools"
_dl_file="xc${_number_of_bits}-v${pkgver}-full-install-linux-x64-installer.run"

source=("$_dl_file"::"$_dl_url/$_dl_path/$_dl_file")
sha256sums=('628803b96f468a5981d6bc1d0a5e6c7fa809e4d87e3cca961805e2a857f5846e')

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
  mv "${pkgdir}/${_instdir}"/*License.txt "${pkgdir}/${_instdir}/docs" 2> /dev/null || true

  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export PATH=\"\$PATH\":'/${_instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT='/${_instdir}'" >> "${pkgdir}/etc/profile.d/${pkgname}.sh"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/${_instdir}/docs/$(basename "${pkgdir}/${_instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod u+s "${pkgdir}/${_instdir}/bin/xclm"
  chmod +x "${pkgdir}/${_instdir}/pic/bin/clang"
}
