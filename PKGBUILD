# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit
pkgver=2.1.0
pkgrel=2
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/reverse-shell/routersploit"
depends=('readline' 'python2-requests' 'python2-paramiko' 'python2-beautifulsoup4' 'python2-pysnmp')
conflicts=("${pkgname}-git")
source=("https://github.com/reverse-shell/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c36bba4da755332d48ef84d1e4659025')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Copy self containing python modules
	install -D ./rsf.py "${pkgdir}/opt/routersploit/rsf.py"
	cp -dpr --no-preserve=ownership "./${pkgname}" "${pkgdir}/opt/${pkgname}"

	# Install a specially crafted invocation for the binary
	install -d "${pkgdir}"/usr/bin
	echo -e "#!/bin/sh\ncd /opt/${pkgname} && exec ./rsf.py \"$@\"\ncd -" > "${pkgdir}/usr/bin/rsf"
	chmod 755 "${pkgdir}/usr/bin/rsf"

	install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
