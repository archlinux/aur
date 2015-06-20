# qt4-fsarchiver by Francois Dupoux, Hihin Ruslan and Dieter Baum
# PKGBUILD by hasufell, updated by DaarkWel

pkgname=qt4-fsarchiver
pkgver=0.6.19_14
pkgrel=1
pkgdesc='GUI for fsarchiver'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/qt4-fsarchiver/'
license=('GPL')
depends=('fsarchiver' 'gksu')
makedepends=('qt4')
source=("http://sourceforge.net/projects/${pkgname}/files/source/${pkgname}-${pkgver//_/-}.tar.gz")

sha256sums=('93da0bd6f40f020df0b3f602e67ea66689333afb1996b9b2bdf41c05c6340e4a')

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
	sed s/Terminal=true/Terminal=false/ -i ${pkgdir}/usr/share/applications/qt4-fsarchiver.desktop
	sed s/sudo/gksu/ -i ${pkgdir}/usr/share/applications/qt4-fsarchiver.desktop
	
}

