# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="Redirector"
pkgname=firefox-redirector
pkgver=3.5.2
pkgrel=1
pkgdesc="Automatically redirects to user-defined urls on certain pages"
arch=("any")
url="https://einaregilsson.com/redirector/"
license=("MIT")
groups=("firefox-addons")
makedepends=("zip")
source=("https://github.com/einaregilsson/Redirector/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"remove_persistent.patch")
sha512sums=('caecc14ac52e4c68b394be20ab562ad9046165e72f98b524f65d6ca5f090fbfd1339d963f551f968aebe1edd2d4ec50176a6b6c66bde3e323fb627f729f5a319'
            '01906062037678d4d76d04f4e5f1f541b292582543ec9cf9244c04ab84b1561ee98de73d3bbcb3147ed254ba6c0e4653137e3b7a7d30605b7d3a9a2e073dccf3')

prepare() {
	patch --directory "${_name}-${pkgver}" --strip 1 < remove_persistent.patch
}

build() {
	cd "${_name}-${pkgver}"

	rm --force --recursive -- \
		.gitignore \
		build.py \
		icon.html \
		nex-build.sh \
		promo

	zip extension.zip -X --filesync --recurse-paths -- *
}

package() {
	cd "${_name}-${pkgver}"

	install -D --mode 644 -- extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/redirector@einaregilsson.com.xpi"
	install -D --mode 644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
