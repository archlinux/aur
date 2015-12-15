# Maintainer: ssf <punx69 at gmx dot net>

pkgbase='qt-style-kvantum-git'
pkgname=('qt5-style-kvantum' 'qt4-style-kvantum' 'kvantum-manager' 'kvantum-themes' 'kvantum-kde-colorschemes')
pkgver=0.9.3.r272
pkgrel=1
pkgdesc='SVG theme engine for Qt'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/Kvantum'
license=('GPL3')
groups=('qt-style-kvantum')
makedepends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'libxext' 'qt4' 'findutils' 'git' 'sed')
source=("${pkgbase//-git/}::git://github.com/tsujan/Kvantum.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase//-git/}"
	_rev=$(git rev-list --count HEAD)
	_ver=$(cat Kvantum/ChangeLog|head -1|cut -d"V" -f2)
	printf "$_ver.r$_rev"
}

prepare() {
	cd "${pkgbase//-git/}"/Kvantum
	cp -R style style-qt4
}

build() {
###great! now we need to build everything until they split build...
	cd "${pkgbase//-git/}"/Kvantum/style-qt4
	/usr/lib/qt4/bin/qmake
	make
	cd ../style
	/usr/lib/qt/bin/qmake
	make
	cd ../kvantumpreview
	/usr/lib/qt/bin/qmake
	make
	cd ../kvantummanager
	/usr/lib/qt/bin/qmake
	make
}

package_qt5-style-kvantum() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='SVG theme engine for Qt5'
	depends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'libxext')	
	install -Dm0644 "${srcdir}"/"${pkgbase//-git/}"/Kvantum/style/libkvantum.so "${pkgdir}"/usr/lib/qt/plugins/styles/libkvantum.so
}

package_qt4-style-kvantum() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='SVG theme engine for Qt4'
	depends=('qt4' 'libxext')
	install -Dm0644 "${srcdir}"/"${pkgbase//-git/}"/Kvantum/style-qt4/libkvantum.so "${pkgdir}"/usr/lib/qt4/plugins/styles/libkvantum.so
}

package_kvantum-manager() {
	pkgname=("${pkgname}" "${pkgname}-git=${pkgver}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='An easy way to configure the Kvantum theme engine(Qt5 build)'
	depends=('qt5-base' 'libxext')
	install -Dm0755 $srcdir/"${pkgbase//-git/}"/Kvantum/kvantumpreview/kvantumpreview "${pkgdir}"/usr/bin/kvantumpreview
	install -Dm0755 $srcdir/"${pkgbase//-git/}"/Kvantum/kvantummanager/kvantummanager "${pkgdir}"/usr/bin/kvantummanager
	install -Dm0644 $srcdir/"${pkgbase//-git/}"/Kvantum/kvantummanager/data/kvantummanager.desktop "${pkgdir}"/usr/share/applications/kvantummanager.desktop
	install -Dm0644 $srcdir/"${pkgbase//-git/}"/Kvantum/kvantumpreview/kvantum.svg "${pkgdir}"/usr/share/pixmaps/kvantum.svg
###no double entries please!
	sed -i 's#Utility;##' "${pkgdir}"/usr/share/applications/kvantummanager.desktop
}

package_kvantum-themes() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='default Kvantum themes'
	cd "${srcdir}"/"${pkgbase//-git/}"/Kvantum/themes
	_dirs="$(find kvthemes -mindepth 1 -maxdepth 1 -type d|cut -d"/" -f2)"
	for _dir in $_dirs; do
		install -d "${pkgdir}"/usr/share/themes/$_dir/Kvantum
		mv "${srcdir}"/"${pkgbase//-git/}"/Kvantum/themes/kvthemes/$_dir/* "${pkgdir}"/usr/share/themes/$_dir/Kvantum
	done
	chmod -R 755 "${pkgdir}"/usr/share/themes
}

package_kvantum-kde-colorschemes() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='default Kvantum KDE color schemes'
	install -d "${pkgdir}"/usr/share/color-schemes
	mv $srcdir/"${pkgbase//-git/}"/Kvantum/color/Kvantum.colors "${pkgdir}"/usr/share/color-schemes
	mv $srcdir/"${pkgbase//-git/}"/Kvantum/themes/colors/*.colors "${pkgdir}"/usr/share/color-schemes
	install -d "${pkgdir}"/usr/share/apps/color-schemes
	cp -R "${pkgdir}"/usr/share/color-schemes "${pkgdir}"/usr/share/apps/color-schemes
	chmod -R 755 "${pkgdir}"/usr/share/color-schemes
	chmod -R 755 "${pkgdir}"/usr/share/apps/color-schemes
}
