# Maintainer: eggix <eggix@protonmail.com>

pkgname=apparatus-git
pkgver=v0.4.1.r117.g18446e9
pkgrel=1
pkgdesc="A hybrid graphics editor / programming environment for creating interactive diagrams."
arch=('any')
url="http://aprt.us/"
_basename="${pkgname%-git}"
provides=("$_basename")
license=('MIT')
depends=('bash')
makedepends=('git' 'npm')
source=("${pkgname}::git+https://github.com/cdglabs/apparatus"
				"apparatus.desktop"
				"apparatus")
sha256sums=('SKIP'
            '26a232988ec786a16ad69c3fd291d426415c17227614388634f69a15e962561e'
            '00c72c51b1c81492cb23a55cab958d7c052e18ced77aee7b36da5fd849008db6')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "${pkgname}"
	npm run test
}

build() {
	cd "${pkgname}"
	npm install --cache "${srcdir}/npm-cache"
	npm run build
}

package() {
	install -Dm755 "apparatus" "${pkgdir}/usr/bin/${_basename}"
	install -Dm644 "apparatus.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"

	cd "${pkgname}"
	install -Dm644 index.html "${pkgdir}/usr/share/${_basename}/index.html"
	cp -a vendor "${pkgdir}/usr/share/${_basename}/"
	cp -a dist "${pkgdir}/usr/share/${_basename}/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
