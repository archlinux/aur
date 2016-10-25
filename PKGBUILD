# qt4-fsarchiver by Francois Dupoux, Hihin Ruslan and Dieter Baum
# PKGBUILD by hasufell, updated by DaarkWel

pkgname=qt4-fsarchiver
pkgver=0.8.0_5
pkgrel=1
pkgdesc='GUI for fsarchiver'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/qt4-fsarchiver/'
license=('GPL')
depends=('fsarchiver' 'gksu' 'qt4')
makedepends=()
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/source/${pkgname}-${pkgver//_/-}.tar.gz")

sha256sums=('0e86b52fc3d07dde4d04b87e843fd50bdb86f5dd8902096a50ce07c05b23baa2')

build() {
	cd "${srcdir}/${pkgname}"
	qmake-qt4
}

package() {
	cd "${srcdir}/${pkgname}"
	make
	make INSTALL_ROOT="${pkgdir}" install
	mkdir -p ${pkgdir}/usr/share/qt/translations
	rm -R ${pkgdir}/usr/share/qt4
	install -D -m644 ${srcdir}/${pkgname}/translations/*.qm ${pkgdir}/usr/share/qt/translations
	
# workaround for fixed destination path in qmake project
mkdir -p ${pkgdir}/usr/bin
mv ${pkgdir}/usr/sbin/qt4-fsarchiver ${pkgdir}/usr/bin/
mv ${pkgdir}/usr/sbin/findsmb-qt ${pkgdir}/usr/bin/
mv ${pkgdir}/usr/sbin/qt4-fsarchiver_polkit ${pkgdir}/usr/bin/
rmdir ${pkgdir}/usr/sbin
	
	sed s/sbin/bin/ -i ${pkgdir}/usr/bin/qt4-fsarchiver_polkit
	sed s/sbin/bin/ -i ${pkgdir}/usr/share/applications/gnome-qt4-fsarchiver.desktop
	sed s/kdesudo/kdesu/g -i ${pkgdir}/usr/share/applications/kde-qt4-fsarchiver.desktop
#	sed s/sudo/gksu/ -i ${pkgdir}/usr/share/applications/gnome-qt4-fsarchiver.desktop
	
}

