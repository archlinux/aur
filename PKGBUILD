# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit
pkgver=2.2.1
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/reverse-shell/routersploit"
depends=('readline' 'python2-requests' 'python2-paramiko' 'python2-beautifulsoup4' 'python2-pysnmp')
source=("${pkgname}_v${pkgver}.tar.gz"::"https://github.com/reverse-shell/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('59262588fb1004a22c72f6f551f455f82bc461c2768dd001694c8a395cf11796138627f9bf94f45da1f289910b9119bcbabd1deb74f97e2649220631a59bcb4a')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Copy self containing python modules
	install -D ./rsf.py "${pkgdir}/opt/routersploit/rsf.py"
	cp -dpr --no-preserve=ownership "./${pkgname}" "${pkgdir}/opt/${pkgname}"

	# Install a specially crafted invocation for the binary
	install -d "${pkgdir}"/usr/bin
	echo -e "#!/bin/sh\ncd /opt/${pkgname} && exec ./rsf.py \"\$@\"\ncd -" > "${pkgdir}/usr/bin/rsf"
	chmod 755 "${pkgdir}/usr/bin/rsf"

	install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
