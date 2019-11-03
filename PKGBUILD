# Maintainer: Matthew Shaw <mtthwjhnshw at gmail dot com>

pkgname=nifskope-git
pkgver=1.1.3.699.g7261b0a
pkgrel=1
pkgdesc="Utility for opening and editing the NetImmerse (NIF) file format."
arch=('i686' 'x86_64')
url="http://niftools.org"
license=('custom')
depends=('qt5-base')
makedepends=('git')
source=('git://github.com/niftools/nifskope.git'
	'git://github.com/niftools/nifdocsys.git'
	'git://github.com/qhull/qhull.git'
	'git://github.com/madler/zlib.git')
md5sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	git submodule update --init --recursive
	git pull origin pull/147/head
	sed -i -e "\$atarget.path = /usr/bin\nINSTALLS += target" NifSkope.pro
}


pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --always | sed 's|nifskope-\([0-9]\+.[0-9]\+.[0-9]\+\)|\1|' | sed 's|-|.|g'
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	qmake-qt5 *.pro
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
	install -Dm755 "${srcdir}/${pkgname%-git}/build/docsys/nifxml/nif.xml" "${pkgdir}/usr/share/${pkgname%-git}/nif.xml"
	install -Dm755 "${srcdir}/${pkgname%-git}/build/docsys/kfmxml/kfm.xml" "${pkgdir}/usr/share/${pkgname%-git}/kfm.xml"
	install -Dm755 "${srcdir}/${pkgname%-git}/release/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
