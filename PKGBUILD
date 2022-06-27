# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit-git
_pkgname=routersploit
pkgver=2.2.1.r406.g3fd3946
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/threat9/routersploit"
depends=('python-future' 'python-requests' 'python-paramiko' 'python-pysnmp' 'python-pycryptodome')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/threat9/routersploit")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${_pkgname}"

	# Copy self containing python modules
	install -D ./rsf.py "${pkgdir}/opt/routersploit/rsf.py"
	cp -dpr --no-preserve=ownership "./${_pkgname}" "${pkgdir}/opt/${_pkgname}"

	# Install a specially crafted invocation for the binary
	install -d "${pkgdir}"/usr/bin
	echo -e "#!/bin/sh\ncd /opt/${_pkgname} && exec ./rsf.py \"\$@\"\ncd -" > "${pkgdir}/usr/bin/rsf"
	chmod 755 "${pkgdir}/usr/bin/rsf"

	install -D ./LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
