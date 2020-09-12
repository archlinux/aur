pkgname=ostree-releng-scripts
pkgdesc='Various scripts for operating on an OSTree repository'
pkgver=2016.1
pkgrel=2
arch=(any)
depends=(python2-gobject rsync ostree)
license=(BSD LGPL2.1)
url=https://github.com/ostreedev/ostree-releng-scripts
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('65f85bf12ae5c53c90a8612acaa846e7e10557ad69985879bb69d4daa1096e207b7b4ef6fe79cf919498f9166cdf83ba2869e2538d339b50ba184b88b5067054')

prepare () {
	cd "${pkgname}-${pkgver}"

	msg2 "Fixing Python shebangs..."
	printf '   '
	for file in * ; do
		[[ -x ${file} ]] || continue
		printf ' %s' "${file}"
		sed -i '1c\#! /usr/bin/python2' "${file}"
	done
	echo
}

package () {
	cd "${pkgname}-${pkgver}"
	printf '   '
	for file in * ; do
		[[ -x ${file} ]] || continue
		if [[ ${file} = ostree-* ]] ; then
			printf ' %s' "${file}"
			install -Dm755 "${file}" "${pkgdir}/usr/bin/${file}"
		else
			printf ' %s' "ostree-${file}"
			install -Dm755 "${file}" "${pkgdir}/usr/bin/ostree-${file}"
		fi
	done
	echo

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
