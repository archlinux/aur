# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="Redirector"
_commit="91eb77bbead85fde96eb2683d7c5fba701b5d643"
pkgname=firefox-redirector
pkgver=3.5.4
pkgrel=1
pkgdesc="Automatically redirects to user-defined urls on certain pages"
arch=("any")
url="https://einaregilsson.com/redirector/"
license=("MIT")
groups=("firefox-addons")
makedepends=("zip")
source=("https://github.com/einaregilsson/Redirector/archive/${_commit}/${pkgname}-${pkgver}.tar.gz"
	"remove_persistent.patch")
sha512sums=('8c19651662d32bb99021542bdf81c0d5c5ce27f4a1eb96afbeeda615f4afc7c76bba7c9f830367bc829b54b27fd4533a6d7c20070eaa2019ecb7f42ad17fe789'
            '01906062037678d4d76d04f4e5f1f541b292582543ec9cf9244c04ab84b1561ee98de73d3bbcb3147ed254ba6c0e4653137e3b7a7d30605b7d3a9a2e073dccf3')

prepare() {
	patch --directory "${_name}-${_commit}" --strip 1 < remove_persistent.patch
}

build() {
	cd "${_name}-${_commit}"

	rm --force --recursive -- \
		.gitignore \
		build.py \
		icon.html \
		nex-build.sh \
		promo

	zip extension.zip -X --filesync --recurse-paths -- *
}

package() {
	cd "${_name}-${_commit}"

	install -D --mode 644 -- extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/redirector@einaregilsson.com.xpi"
	install -D --mode 644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
