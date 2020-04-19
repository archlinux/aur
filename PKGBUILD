# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=1
pkgrel=3
_patchfile="${_pkgbase}-${pkgver}-${pkgrel}.patch"
pkgdesc="Experimental HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://gist.github.com/conqp/33baa079d9524914c4c0c196200e4f89"
license=('GPL2')
depends=('dkms')
makedepends=('patchutils')
source=("${_patchfile}::https://gist.githubusercontent.com/conqp/33baa079d9524914c4c0c196200e4f89/raw/a4effce73423cfd36615ff664b0331e52ef95e92/amd-sfh.patch"
        'Makefile.append'
        'dkms.conf')
sha256sums=('e096b2c033601603ab1a820fd0bc6cd0402b7f1926ba04a627153466b4be80a3'
            'aac46663193f08c6331b76faa8752b08b3169fe586da337f662c0e43428d94fb'
            '345bebda48d6dda26f8f0c8282f7c276f946fb14d089b831817eb01fd6ea5dce')

prepare() {
	# Fix patch for DKMS.
	filterdiff -p1 -x "Documentation/*" \
	               -x "MAINTAINERS" \
	               -x "drivers/hid/Kconfig" \
	               -x "drivers/hid/Makefile" \
	"${srcdir}/${_patchfile}" | patch -Np1

	# Append DKMS targets to Makefile.
	cat Makefile.append >> drivers/hid/amd-sfh-hid/Makefile
}

package() {
	local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	install -dm 755 "${DEST}"

	for file in drivers/hid/amd-sfh-hid/*; do
		install -m 640 "${file}" "${DEST}"
	done

	# Copy dkms.conf
	install -m644 dkms.conf "${DEST}"

	# Set name and version
	sed -e "s/@PKGVER@/${pkgver}/" -i "${DEST}/dkms.conf"
}
