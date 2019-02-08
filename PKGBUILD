# Maintainer: Grey Christoforo <first name at last name dot net>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: thodnev <thodnev at github>

_number_of_bits=32
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=2.10
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for all of their 32bit microcontrollers"
arch=(i686 x86_64)
url=https://www.microchip.com/development-tools/downloads-archive
license=(custom)
depends_i688=(gcc-libs)
depends_x86_64=(lib32-gcc-libs)
makedepends=(sdx)
makedepends_x86_64=(lib32-tclkit)
makedepends_i686=(tclkit)

options=(!strip docs libtool emptydirs !zipman staticlibs)
source=("http://ww1.microchip.com/downloads/en/DeviceDoc/xc${_number_of_bits}-v$pkgver-full-install-linux-installer.run"
        "bitrock-unpacker.tcl")

md5sums=('d090f0f44a2af1abb3dd7e17d12381ac'
         '70dedba4c417f8c0bb07c32d19e9d197')

install=$pkgname.install

instdir="/opt/microchip/xc${_number_of_bits}/v${pkgver}"

build() {
  msg2 "Unpacking files from installer"
  ./bitrock-unpacker.tcl ./xc${_number_of_bits}-v$pkgver-full-install-linux-installer.run ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}${instdir}"
  mv unpacked.vfs/compiler/programfiles*/* "${pkgdir}${instdir}"
  mv unpacked.vfs/licensecomponent/xclmBinlinux32/bin/{roam.lic,xclm} "${pkgdir}${instdir}/bin"
  chmod +s "${pkgdir}${instdir}/bin/xclm"
  sed -i "s/<xclm>/<xclm>\n\t<xclm:LicenseDirectory xclm:path=\"\/opt\/microchip\/xclm\/license\/\" \/>/" \
  unpacked.vfs/licensecomponent/xclmBinlinux32/etc/xclm.conf
  rsync -av unpacked.vfs/licensecomponent/xclmBinlinux32/etc "${pkgdir}${instdir}"
  rsync -av unpacked.vfs/licensecomponent/xclmallDocs "${pkgdir}${instdir}/docs/xclm"
  cp "${pkgdir}${instdir}"/*License.txt "${pkgdir}${instdir}/docs" 2>/dev/null || true
  mv "${pkgdir}${instdir}"/*License.txt "${pkgdir}${instdir}" 2>/dev/null || true

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export PATH=\"\$PATH\":'${instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT='${instdir}'" >> "$pkgdir/etc/profile.d/${pkgname}.sh"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${instdir}/docs/$(basename "${pkgdir}${instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  # Workaround to skip license checks
  # https://github.com/cv007/XC3216
  echo -en "*cc1:+ -mafrlcsj\n\n*cc1plus:+ -mafrlcsj" > "${pkgdir}${instdir}/lib/gcc/specs"
}
