# Maintainer: linuxer <linuxer@artixlinux.org>
#             improved packages and compatibility
# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: superlex
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=r5u87-webcam-drivers
pkgver=0.2.2
pkgrel=1
_alias=r5u87x
pkgdesc='Userspace modules for Ricoh R5U870 OEM cameras, improved packages and compatibility'
arch=('i686' 'x86_64')
url='https://gitea.artixlinux.org/linuxer/r5u87x'
license=('GPL2')
depends=('glib2' 'libusb-compat' 'lib32-libusb-compat')
optdepends=('guile: script for extracting firmware from Windows driver')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d87dc965f6fcb2a1c849ff309d8bc4e4669b9b37d73ba875af35f580c5e32036')

prepare() {
	mv "${srcdir}/${pkgver}.tar.gz" "${srcdir}/${_alias}.tar.gz"
	cd ${srcdir}/${_alias}
	# fix udev rule
	sed -i 's| --reload||' contrib/90-r5u87x-loader.rules.in
}

build() {
	cd ${srcdir}/${_alias}
	# set UCODE_PATH because we don't install to default location
	make UCODE_PATH=/usr/lib/firmware/r5u87x-%vid%-%pid%.fw
}

package() {
	cd ${srcdir}/${_alias}
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/ru587x/ucode"
	install "${srcdir}/${_alias}/ricoh-webcam-loader" ${pkgdir}/usr/bin
	make DESTDIR="${pkgdir}" \
		sbindir="/bin" \
		firmdir="/lib/ucode" \
		UDEV_INSTALL="/usr/lib/udev/rules.d" \
	install recode-fw.scm ${pkgdir}/usr/bin
	cp -r "${pkgdir}/usr/lib/ucode" "${pkgdir}/usr/lib/ru587x/"
}

