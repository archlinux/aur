# Maintainer: Ryan Owens <RyanOwens[at]linux[dot]com>

pkgname=kiss
pkgver=5.1.3
pkgrel=1
pkgdesc="KIPR's Instructional Software System"
arch=('any')
url="https://github.com/kipr/pcompiler"
license=('GPL3')
depends=('cmake>=2.8.12' 'qt5-quick1' 'qt5-base' 'libkar' 'pcompiler' 'libkovanserial' 'qscintilla-qt5' 'qtwebkit')
provides=('pcompiler')
source=("https://github.com/kipr/kiss/archive/5.1.3.tar.gz"
	"kiss.desktop"
	"kiss.png"
	"kiss.sh")
sha256sums=('65f2b2e223c75acc6d79df4b2f778c2ceeafb864819e595a5c99ed2ac315e659'
	    '20becea94867cf5d9ce7c389544734ac192369d6f4b8d3d8504960e530870690'
	    '02252493c14b7b2b6e7ae74ec972a2dd305c476b1edcfce96ce2acd60e9e3f03'
            'bcadce53b90b17fbc3b3a24e01f58f43920ec9c9b190c755170b375d5e992892') 

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's/target_link_libraries(KISS qscintilla2 pcompiler kar kovanserial ${EXTRA_LIBS})/target_link_libraries(KISS qt5scintilla2 pcompiler kar kovanserial ${EXTRA_LIBS})/' CMakeLists.txt
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make 
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make install
	cd ..
	mkdir -p ${pkgdir}/opt/${pkgname}/
	#mkdir -p ${pkgdir}/usr/share/icons/
	#mkdir -p ${pkgdir}/usr/share/applications/
	#mkdir -p ${pkgdir}/usr/bin/

	install -Dm644 ${srcdir}/kiss.desktop ${pkgdir}/usr/share/applications/kiss.desktop
	install -Dm644 ${srcdir}/kiss.png ${pkgdir}/usr/share/icons/kiss.png
	install -Dm555 ${srcdir}/kiss.sh ${pkgdir}/usr/bin/KISS

	cd deploy
	install -Dm555 ./KISS ${pkgdir}/opt/${pkgname}/KISS
	#install -Dm555 ./KISS ${pkgdir}/usr/bin/KISS
	install -dm666 ./docs/ ${pkgdir}/opt/${pkgname}/docs/
	cp -a ./docs/. 	${pkgdir}/opt/${pkgname}/docs/
	chmod -R 644 ${pkgdir}/opt/${pkgname}/docs/

	install -dm666 ./locale/ ${pkgdir}/opt/${pkgname}/locale/
	cp -a ./locale/. 	${pkgdir}/opt/${pkgname}/locale/
	chmod -R 666 ${pkgdir}/opt/${pkgname}/locale/

	install -dm666 ./template_packs/ ${pkgdir}/opt/${pkgname}/template_packs/
	cp -a ./template_packs/. 	${pkgdir}/opt/${pkgname}/template_packs/
	chmod -R 666 ${pkgdir}/opt/${pkgname}/template_packs/
}
