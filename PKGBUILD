# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=qmake-mimetypes
_ver=4.3.0-rc1
pkgver=${_ver/-/.}
pkgrel=2
pkgdesc='Mimetypes used by Qt Creator an qmake'
arch=(any)
url='https://www.qt.io/ide/'
license=(LGPL)
makedepends=(jshon libxml2)
source=("qt-creator-$_ver.tar.gz::https://github.com/qtproject/qt-creator/archive/v$_ver.tar.gz")
md5sums=('939b20f783eaabcd420b7ada17cd5081')

package() {
	cd "qt-creator-$_ver"
	
	local dir="$pkgdir/usr/share/mime/packages"
	install -d "$dir"
	cat src/plugins/qmakeprojectmanager/QmakeProjectManager.json.in |
		# poor man’s qmake substitution. JSON can’t handle newlines in strings
		tr '\n' ' ' |
		sed 's/\\//g; s/\$\$dependencyList/"":""/' |
		# extract XML
		jshon -e Mimetypes -u |
		# trim 1st line whitespace and convert former indents to newlines
		sed -E 's/^\s+//' |
		sed -E 's/\s{2,}/\n/g' |
		# insert icons
		sed -E '/vnd\.qt\..+$/a     <icon name="QtProject-qtcreator"/>' |
		# prettify again
		xmllint --format - \
		> "$dir/qmake.xml"
}
