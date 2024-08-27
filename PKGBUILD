# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-plugin
pkgver=4.10.0
pkgrel=1
pkgdesc="The Rutoken plugin is necessary for connecting USB devices with the browser, it allows you to identify devices and work with them."
arch=('i686' 'x86_64')
url="https://www.rutoken.ru/support/download/rutoken-plugin/"
license=('proprietary')
depends=('rutoken-pkcs')
makedepends=('findutils' 'sed' 'grep' 'coreutils' 'bash')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.x86_64.rpm")
sha256sums_x86_64=('91ab121a7bf8f006532da0d6b80dc341cf0fa432eeb668fb69086d071f9c1603')
source_i686=("${pkgname}-${pkgver}-i686.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.i686.rpm")
sha256sums_i686=('ea2dcd5d266cd5cca4f608b700af363189ae8d38d7d2f296dd51ff361628b24a')

package() {
	cp -r "${srcdir}/usr/lib64/mozilla/native-messaging-hosts" "${srcdir}/usr/lib/mozilla/"
	rm -rf "${srcdir}/usr/lib64"
	rm -f "${srcdir}/opt/aktivco/rutokenplugin/librtpkcs11ecp.so"
	ln -s /opt/aktivco/rutokenecp/x86_64/librtpkcs11ecp.so "${srcdir}/opt/aktivco/rutokenplugin/librtpkcs11ecp.so"

	find "${srcdir}" -type d | sed "s#^${srcdir}#${pkgdir}#g" | tail -n +2 | xargs install -d
	eval $(find ${srcdir} -type f -exec bash -c 'echo install \"{}\" \"@$(dirname {})\"\;' \; | sed "s#@${srcdir}#${pkgdir}#g")
	eval $(find ${srcdir} -type l -exec bash -c 'echo ln -s \"$(readlink {})\" \"@{}\"\;' \; | grep -v '.rpm' |  sed "s#@${srcdir}#${pkgdir}#g")
}
