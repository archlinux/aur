# Contributor: piernov <piernov@piernov.org

pkgname=rtlwifi_new-dkms
_pkgname=rtlwifi_new
pkgver=r111.3498e57
pkgrel=1
pkgdesc='Newest Realtek rtlwifi codes'
arch=('i686' 'x86_64')
url='https://github.com/lwfinger/rtlwifi_new'
depends=('dkms')
makedepends=('git')
install=${pkgname}.install
source=("git+https://github.com/lwfinger/rtlwifi_new.git" "dkms.conf" "blacklist-rtlwifi_new-dkms.conf")
sha1sums=('SKIP'
          'ad47c1491db43fa7390a6db380d21bac6a56b5f9'
          '524ea363adee44fb9f2293bde3838b5e235193da')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	install -D -m 644 dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

        install -dm755 "${pkgdir}/etc/modprobe.d"
        install -m644 "blacklist-rtlwifi_new-dkms.conf" "${pkgdir}/etc/modprobe.d"

	# Set name and version
	sed -e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
