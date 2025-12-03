# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-plugin
pkgver=4.11.4
pkgrel=2
pkgdesc="The Rutoken plugin is necessary for connecting USB devices with the browser, it allows you to identify devices and work with them."
arch=('i686' 'x86_64')
url="https://www.rutoken.ru/support/download/rutoken-plugin/"
license=('custom:rutoken-plugin')
depends=('rutoken-pkcs')
makedepends=('findutils' 'sed' 'grep' 'coreutils' 'bash')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.x86_64.rpm")
source_i686=("${pkgname}-${pkgver}-i686.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.i686.rpm")

sha256sums_i686=('8374661e6af98537d3eedf321adb582ac849aa6c8746fbb794ad31234293effb')
sha256sums_x86_64=('01876a9a51e30476a40b92061130e388921e51aab90824c17001d0e6cb6e6e32')

package() {
	cp -r "${srcdir}/usr/lib64/mozilla/native-messaging-hosts" "${srcdir}/usr/lib/mozilla/"
	rm -rf "${srcdir}/usr/lib64"

	find "${srcdir}" -type d | sed "s#^${srcdir}#${pkgdir}#g" | tail -n +2 | xargs install -d
	eval $(find ${srcdir} -type f -exec bash -c 'echo install \"{}\" \"@$(dirname {})\"\;' \; | sed "s#@${srcdir}#${pkgdir}#g")
	eval $(find ${srcdir} -type l -exec bash -c 'echo ln -s \"$(readlink {})\" \"@{}\"\;' \; | grep -v '.rpm' |  sed "s#@${srcdir}#${pkgdir}#g")
	install -Dm644 "${srcdir}/usr/share/doc/rutokenplugin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
