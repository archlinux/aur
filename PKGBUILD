# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=pico8
pkgver=0.2.4c
pkgrel=5
pkgdesc='A fantasy console for making, sharing and playing tiny games and other computer programs.'
arch=('x86_64')
url='https://www.lexaloffle.com/pico-8.php'
license=('custom:pico8')
depends=('wget'
		'sdl2')
provides=('pico8'
		'pico-8')
conflicts=('pico-8')
source=("file://pico-8_${pkgver}_amd64.zip"
		'pico8.desktop'
		'application-pico8.xml'
		'pico8-config')
sha256sums=('00967d08289d08f0fe275b21f9453734fb6c3d7f674191fa6026a0301e837d43'
            'a2bc1eea115b86f5670b89914b3f9cb35577ca52f005e71d0afb4c7a42408d57'
            '4d8aaaeb48541c779e19a5b9d262a3c3fe214b1a5a0946a4d1a64bc2795b5ecd'
            '422c728d6652fc1bef572c38792c08a711ec83e001bc79d69fc71fb918bf3a0c')

prepare() {
	mv -t ${srcdir} pico-8/pico8.dat pico-8/pico-8_manual.txt
	mv pico-8/pico8_dyn pico8
	mv pico-8/lexaloffle-pico8.png pico8.png
	mv pico-8/license.txt LICENSE
	mv pico-8/readme_linux.txt ${pkgname}.1
	gzip -c ${pkgname}.1 > ${pkgname}.1.gz
}

package() {
	dest="${pkgdir}"/opt/${pkgname}
	share="${pkgdir}"/usr/share
	# executables
	install -Dm755 -t "${dest}"/ ${pkgname} ${pkgname}-config
	# data
	install -Dm644 -t "${dest}"/ pico8.dat pico-8_manual.txt
	# license
	install -Dm644 LICENSE "${share}"/licenses/${pkgname}/LICENSE
	# manual
	install -Dm644 ${pkgname}.1.gz "${share}"/man/man1/${pkgname}.1.gz
	# desktop entry
	install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.png "${share}"/icons/${pkgname}.png
	install -Dm644 application-${pkgname}.xml "${share}"/mime/packages/application-${pkgname}.xml
	# PATH symlink
	install -dm755 "${pkgdir}"/usr/bin/
	ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
	ln -s /opt/${pkgname}/${pkgname}-config "${pkgdir}"/usr/bin/${pkgname}-config
}
