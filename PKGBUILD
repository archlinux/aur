# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>
# Contributor: Grey Christoforo <first name at last name dot net>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: thodnev <thodnev at github>

_number_of_bits=32
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=4.35
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for all of their 32bit microcontrollers"
arch=(x86_64)
url=https://www.microchip.com/en-us/tools-resources/develop/mplab-xc-compilers
license=(custom)
depends=(gcc-libs)
makedepends=(bitrock-unpacker rsync)

options=(!strip docs libtool emptydirs !zipman staticlibs)
source=("https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc${_number_of_bits}-v$pkgver-full-install-linux-x64-installer.tar")

sha256sums=('56004fd681edd6513f8cbc5e88e2d453b9ba1a68dd063262649e9a8b540d2709')

install=$pkgname.install

instdir="/opt/microchip/xc${_number_of_bits}/v${pkgver}"

build() {
	msg2 "Unpacking files from Microchip's installer blob"
	bitrock-unpacker ./xc${_number_of_bits}-v$pkgver-full-install-linux-x64-installer.run ./unpacked.vfs
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
