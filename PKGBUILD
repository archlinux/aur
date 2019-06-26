# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=qmake-mimetypes
_ver=4.9.1  # for -rc1 and so on
pkgver=${_ver/-/.}
pkgrel=1
pkgdesc='Mimetypes used by Qt Creator an qmake'
arch=(any)
url='https://www.qt.io/ide/'
license=(LGPL)
makedepends=(jq libxml2)
source=("qt-creator-$_ver.tar.gz::https://github.com/qtproject/qt-creator/archive/v$_ver.tar.gz")
sha256sums=('3e8763c8d5630cba7c191df691d871f835af4e510fea22565bda887b50266d0c')

package() {
	cd "qt-creator-$_ver"
	
	local dir="$pkgdir/usr/share/mime/packages"
	install -d "$dir"
	cat src/plugins/qmakeprojectmanager/QmakeProjectManager.json.in |
		# poor man’s qmake substitution. JSON can’t handle newlines in strings
		tr '\n' ' ' |
		sed 's/\\//g; s/\$\$dependencyList/"":""/' |
		# extract XML
		jq -r '.Mimetypes[]' |
		# trim 1st line whitespace and convert former indents to newlines
		sed -E 's/^\s+//' |
		sed -E 's/\s{2,}/\n/g' |
		# insert icons
		sed -E '/vnd\.qt\..+$/a     <icon name="QtProject-qtcreator"/>' |
		# prettify again
		xmllint --format - \
		> "$dir/qmake.xml"
}
