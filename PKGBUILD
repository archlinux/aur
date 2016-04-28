#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=routersploit
pkgver=2.0.0
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/reverse-shell/routersploit"
depends=('readline' 'python2-requests' 'python2-paramiko' 'python2-beautifulsoup4' 'python2-pysnmp')
conflicts=("${pkgname}-git")
source=("https://github.com/reverse-shell/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e6403d0f7a7fdb51183b62df0eb09225')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Fix wrong python reference
	sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/python2/' ./rsf.py
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
