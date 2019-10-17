# Contributor: piernov <piernov@piernov.org

pkgname=ch34x-dkms-git
_pkgname=ch34x
pkgver=r16.c6b4bc9
pkgrel=1
pkgdesc='CH341SER driver with fixed bug'
arch=('i686' 'x86_64')
url='https://github.com/juliagoda/CH341SER'
depends=('dkms')
makedepends=('git')
install=${pkgname}.install
source=("git+https://github.com/juliagoda/CH341SER.git" "dkms.conf" "blacklist-ch34x-dkms-git.conf")
sha1sums=('SKIP'
          'cbce8f44f307b2a656c34f184871da3bb11d8565'
          '524ea363adee44fb9f2293bde3838b5e235193da')

pkgver() {
	cd "CH341SER"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	git -C "CH341SER" checkout-index --prefix="${pkgdir}/usr/src/${_pkgname}-${pkgver}/" -a
	#cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	install -D -m 644 dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

        install -dm755 "${pkgdir}/etc/modprobe.d"
        install -m644 "blacklist-ch34x-dkms-git.conf" "${pkgdir}/etc/modprobe.d"

	# Set name and version
	sed -e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
