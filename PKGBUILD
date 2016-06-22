# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-monoid-git'
pkgdesc='Open Source coding font'
pkgver=r421.cebcdd6
pkgrel=1
arch=('any')
license=('custom:MIT')
url='http://larsenwork.github.io/monoid/'
source=("${pkgname}::git://github.com/larsenwork/monoid.git"
	'fontbuilder-python3.patch')
install="${pkgname}.install"
depends=('xorg-font-utils' 'fontconfig')
makedepends=('git' 'fontforge' 'python')
conflicts=('ttf-mono16' 'ttf-mono16-git' 'ttf-monoid')
provides=( "${conflicts[@]}" )
sha512sums=('SKIP'
            '7f06b8827ed12b3070512ae58424b92a05635eefe0dee0d6314f1b92230f431e2fde5a2d70adbff324bbcb4ce70b135ccda2a6dfaaeb7b6e4219a447034f00c0')

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "${pkgname}/Scripts"
	patch -p1 < "${srcdir}/fontbuilder-python3.patch"
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
