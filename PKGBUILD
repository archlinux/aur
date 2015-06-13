# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-monoid-git'
pkgdesc='Open Source coding font'
pkgver=r184.4f68767
pkgrel=1
arch=('any')
license=('custom:MIT')
url='http://larsenwork.github.io/monoid/'
source=("${pkgname}::git://github.com/larsenwork/monoid.git"
	'fontbuilder-python3.patch')
install="${pkgname}.install"
depends=('xorg-font-utils' 'fontconfig')
makedepends=('git' 'fontforge' 'python')
conflicts=('ttf-mono16' 'ttf-mono16-git')
provides=( "${conflicts[@]}" )
sha512sums=('SKIP'
            '7f06b8827ed12b3070512ae58424b92a05635eefe0dee0d6314f1b92230f431e2fde5a2d70adbff324bbcb4ce70b135ccda2a6dfaaeb7b6e4219a447034f00c0')

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "${pkgname}"
	patch -p1 < "${srcdir}/fontbuilder-python3.patch"
}

build () {
	cd "${pkgname}"
	python3 -c 'import fontbuilder; fontbuilder.build("_release", "Source", "Monoid.sfdir");'
}

package () {
	cd "${pkgname}"
	install -Dm644 _release/Monoid.ttf \
		"${pkgdir}/usr/share/fonts/TTF/Monoid.ttf"
	install -Dm644 License.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
