# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname="robot-karol"
pkgver="2.3"
pkgrel="4"
pkgdesc="A programming environment for introducing children to programming and algorithm design."
url='https://www.mebis.bayern.de/medien/faecher/mint/informatik/robot-karol/'
arch=('any')
license=('custom')
depends=('wine')
makedepends=('innoextract' 'icoutils' 'imagemagick')
source=('https://www.mebis.bayern.de/wp-content/uploads/2013/11/Robot_Karol_setup.zip')
md5sums=('91149127108be600bd5dd084d67444b3')


build() {
    innoextract -d "${srcdir}" "${srcdir}/setupd.exe"
    wrestool -x -t 14 "${srcdir}/app/karol.exe" > "${srcdir}/${pkgname}.ico"
    convert "${srcdir}/${pkgname}.ico" "${srcdir}/${pkgname}.png"
}

package() {
	mkdir -p -m755 "${pkgdir}/opt/${pkgname}" 
    cp -ar "$srcdir/app/"* "${pkgdir}/opt/${pkgname}"

    install -D -m644 "${pkgdir}/opt/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    mkdir -p -m755 "${pkgdir}/usr/bin/" 

	printf "#!${SHELL}
wine /opt/${pkgname}/karol.exe /IC:\\
" >> "${pkgdir}/usr/bin/${pkgname}" 

	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p -m755 "${pkgdir}/usr/share/applications/" 

	printf "[Desktop Entry]
Version=${pkgver}
Type=Application
Name=Robot Karol
Comment=$pkgdesc
Exec=${pkgname}
Icon=${pkgname}
Categories=Education
Terminal=false
StartupNotify=true
" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
