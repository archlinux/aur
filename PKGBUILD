# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname='robot-karol'
pkgver='3.0.4'
pkgrel='1'
pkgdesc='A programming environment for introducing children to programming and algorithm design.'
url='https://www.mebis.bayern.de/infoportal/empfehlung/robot-karol/'
arch=('any')
license=('custom')
depends=('java-runtime-headless=8' 'archlinux-java-run')
makedepends=('gendesk' 'imagemagick' 'unzip')
source=('https://www.mebis.bayern.de/wp-content/uploads/sites/2/2019/10/RobotKarol30_other.zip'
        'LICENSE')
sha256sums=('bd1b8243315a37da9fb6e75d3081e21c0deba6c3436aa17d8e20a4d4a03c1263'
            'fdeab93675448f2dc577c6507c65ad65715025fb0ae005637ff4db6e3b1eeecc')

prepare() {
    unzip -j "${srcdir}/RobotKarol.jar" "icons/Karol.ico" 
    convert "${srcdir}/Karol.ico" "${srcdir}/${pkgname}.png"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
    install -D -m644 "${srcdir}/RobotKarol.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
    install -D -m644 "${srcdir}/tipps.txt" "${pkgdir}/usr/share/java/${pkgname}/tipps.txt"
    install -D -m644 "${srcdir}/karol.prop" "${pkgdir}/usr/share/java/${pkgname}/karol.prop"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/Dokumentation/Karol30Handbuch.pdf" "${pkgdir}/usr/share/doc/${pkgname}/Karol30Handbuch.pdf"
    mkdir -p -m755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
    cp ${srcdir}/Beispiele/* "${pkgdir}/usr/share/doc/${pkgname}/examples"
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	mkdir -p -m755 "${pkgdir}/usr/bin/"
	printf "#!/bin/sh
cd /usr/share/java/${pkgname}
archlinux-java-run --min 8 -- -jar /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
" >> "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

}
