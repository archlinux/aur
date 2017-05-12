# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=qmake-mimetypes
_ver=4.3.0-rc1
pkgver=${_ver/-/.}
pkgrel=1
pkgdesc='Mimetypes used by Qt Creator an qmake'
arch=(any)
url='https://www.qt.io/ide/'
license=(LGPL)
depends=()
makedepends=()
source=("qt-creator-$_ver.tar.gz::https://github.com/qtproject/qt-creator/archive/v$_ver.tar.gz")
md5sums=('939b20f783eaabcd420b7ada17cd5081')

package() {
	cd "qt-creator-$_ver"
	
	local dir="$pkgdir/usr/share/mime/packages"
	install -d "$dir"
	cat src/plugins/qmakeprojectmanager/QmakeProjectManager.json.in \
		| tr '\n' ' ' \
		| sed 's/\\//g; s/\$\$dependencyList/"":""/' \
		| jshon -e Mimetypes -u \
		| sed -E 's/^\s+//' \
		| xmllint --format - \
		> "$dir/qmake.xml"
}
