# Contributor: feanor1397 <feanor1397@gmail.com>

pkgname=rtlwifi_new-extended-dkms
_pkgname=rtlwifi_new
pkgver=r288.2c8da8d
pkgrel=1
pkgdesc='Newest Realtek rtlwifi codes, extended branch'
arch=('i686' 'x86_64')
url='https://github.com/lwfinger/rtlwifi_new'
depends=('dkms')
makedepends=('git')
provides=('rtlwifi_new-dkms')
conflicts=('rtlwifi_new-dkms')
install=${pkgname}.install
source=("git+https://github.com/lwfinger/rtlwifi_new.git#branch=extended")
sha1sums=('SKIP')



pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	
	# Fix for low signal on 8723de
    install -dm755 "${pkgdir}/etc/modprobe.d"
	echo "options rtl8723de ant_sel=2" >> "${pkgdir}/etc/modprobe.d/rtl8723de.conf"
        
	# Set name and version
	sed -e "s/0.6/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
	sed -e "s/rtlwifi-new/${_pkgname}/" \
                -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf	

	# Install RTL8812AE firmwares
	install -dm755 "${pkgdir}/usr/lib/firmware/rtlwifi"
	install -m644 "${_pkgname}/firmware/rtlwifi/rtl8812aefw.bin" "${pkgdir}/usr/lib/firmware/rtlwifi"
	install -m644 "${_pkgname}/firmware/rtlwifi/rtl8812aefw_wowlan.bin" "${pkgdir}/usr/lib/firmware/rtlwifi"
}
