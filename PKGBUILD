# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=hid-playstation
pkgname=${_pkgbase}-dkms
pkgver=20201219
pkgrel=1
pkgdesc="Sony's official HID driver for the PS5 DualSense controller."
arch=(any)
url="https://patchwork.kernel.org/project/linux-input/list/?series=404369"
license=("GPL2")
depends=('dkms')
source=(
	'hid-playstation.c' 'dkms.conf' 'hid-ids.h' 'Makefile'
	'work-without-modifying-hid-quirks.patch'
)

md5sums=('ea60e546559ded5ac2ef03f8f6950145'
         '6d97239c33773b3f2fc5d497e98a1017'
         'c9585c976df5c262127bfe8b595824b3'
         'b5424fcb24f12a53b4ff18f1b85bcb23'
         '52c3680b1fad94cc4cc5b1081bb1c9b5')

package() {
	cd "${srcdir}"

	install -Dm644 dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	install -Dm644 hid-playstation.c hid-ids.h Makefile \
		-t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

	# The hid-playstation driver relies on modifying hid-quirks.c for device
	# detection, we can't do that for a dkms module though so modify the
	# driver's source file to do it there instead, like hid-nintendo does.
	cd "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
	patch -Np1 -i "${srcdir}/work-without-modifying-hid-quirks.patch"
}
