# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-plugin
pkgver=4.12.0
pkgrel=1
pkgdesc="The Rutoken plugin is necessary for connecting USB devices with the browser, it allows you to identify devices and work with them."
arch=('i686' 'x86_64')
url="https://www.rutoken.ru/support/download/rutoken-plugin/"
license=('custom:rutoken-plugin')
depends=('rutoken-connect')
makedepends=('findutils' 'sed' 'grep' 'coreutils' 'bash')
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.x86_64.rpm")
source_i686=("${pkgname}-${pkgver}-i686.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.i686.rpm")

sha256sums_i686=('2d3d10355a3709f625654ad4a575a07fa54929c3573af3cdd9adb6722b24d432')
sha256sums_x86_64=('a2a5b171934fa004461fe7812106930de52aded673700ae86467b5927de4b495')

package() {
	cp -r "${srcdir}/usr/lib64/mozilla/native-messaging-hosts" "${srcdir}/usr/lib/mozilla/"
	rm -rf "${srcdir}/usr/lib64"
	rm -rf "${srcdir}/usr/lib/mozilla/plugins/pcache"
	rm -f "${srcdir}/usr/lib/mozilla/plugins/librtpkcs11ecp.so"
	ln -s /opt/aktivco/rutokenconnect/librtpkcs11ecp.so "${srcdir}/usr/lib/mozilla/plugins/librtpkcs11ecp.so"
	rm -f "${srcdir}/opt/aktivco/rutokenplugin/librtpkcs11ecp.so"

	install -Dm644 "${srcdir}/usr/share/doc/rutokenplugin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm -rf "${srcdir}/usr/share/"

	for dir in 'etc' 'usr' 'opt'
	do
		cp -a "${srcdir}/${dir}" "${pkgdir}"
	done
}
