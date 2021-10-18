# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-plugin
pkgver=4.5.6
pkgrel=1
pkgdesc="The Rutoken plugin is necessary for connecting USB devices with the browser, it allows you to identify devices and work with them."
arch=('i686' 'x86_64')
url="https://www.rutoken.ru/support/download/rutoken-plugin/"
license=('unknown')
makedepends=("findutils" "sed" "grep" "coreutils" "bash")

source_x86_64=("${pkgname}-${pkgver}.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.x86_64.rpm")
sha256sums_x86_64=("b693dd8873b9a9b5b11aa399fc194a197ce4d2f66933d2b535c420d41e1f31b5")
source_i686=("${pkgname}-${pkgver}.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.i686.rpm")
sha256sums_i686=("8f5c8fb368bb67cd8114c64d30b7d5068055a4734331bd233bee4c12359b1c40")

package() {
	mv "${srcdir}/usr/lib64/mozilla/native-messaging-hosts" "${srcdir}/usr/lib/mozilla/"
	rm -rf "${srcdir}/usr/lib64"
	find "${srcdir}" -type d | sed "s#^${srcdir}#${pkgdir}#g" | tail -n +2 | xargs install -d
	eval $(find ${srcdir} -type f -exec bash -c 'echo install \"{}\" \"@$(dirname {})\"\;' \; | sed "s#@${srcdir}#${pkgdir}#g")
	eval $(find ${srcdir} -type l -exec bash -c 'echo ln -s \"$(readlink {})\" \"@{}\"\;' \; | grep -v '.rpm' |  sed "s#@${srcdir}#${pkgdir}#g")
}
