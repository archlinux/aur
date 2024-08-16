# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-monoid-git
pkgdesc='Open Source coding font'
pkgver=r439.0673c8d6
pkgrel=1
arch=(any)
license=(custom:MIT)
url=http://larsenwork.github.io/monoid/
makedepends=(git fontforge python)
conflicts=(ttf-mono16 ttf-mono16-git ttf-monoid)
provides=("${conflicts[@]}")
source=("${pkgname}::git+https://github.com/larsenwork/monoid.git")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${pkgname}"
	export PYTHONPATH="$(pwd)/Scripts"
	python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid.sfdir");'
	python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid-Bold.sfdir");'
	python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid-Italic.sfdir");'
	python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid-Retina.sfdir");'
}

package () {
	cd "${pkgname}"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 -t "${pkgdir}/usr/share/fonts/TTF" _build/*.ttf
	install -Dm644 Readme.md \
		"${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
