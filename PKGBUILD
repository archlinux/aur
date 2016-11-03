pkgname='ostree-releng-scripts'
pkgdesc='Various scripts for operating on an OSTree repository'
pkgver='2016.1'
pkgrel='1'
arch=('any')
depends=('python2-gobject' 'rsync' 'ostree')
makedepends=('git-evtag')
license=('BSD', 'LGPL2.1')
url='https://github.com/ostreedev/ostree-releng-scripts'
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha512sums=('SKIP')

prepare () {
	cd "${pkgname}"
	msg2 'Veryfying Git tag signature...'
	git-evtag verify "v${pkgver}" || exit 1

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
	cd "${pkgname}"
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
