#Maintainer: Sam Peters <dev at libertycloud dot de>
# Contributor: Dan McCurry <dan.mc at protonmail dot com>
pkgname=profex
pkgver=5.2.9
pkgrel=1
year=2024
month=05
pkgdesc="A program for Rietveld refinement of powder X-ray diffraction data."
arch=('i686' 'x86_64')
url="https://profex.doebelin.org"
license=('GPL2')
groups=('science')
depends=('qt6-5compat'
	'qt6-declarative'
	'qt6-svg')
optdepends=('bgmn: the needed backend for the program, not required to build or start the program')
provides=('profex')
conflicts=('profex')
source=("https://www.profex-xrd.org/wp-content/uploads/${year}/${month}/${pkgname}-${pkgver}.tar.gz"
	'profex.desktop'
	'gzlib.c.new'
	'gzread.c.new'
	'gzwrite.c.new')
sha256sums=('954ce7b92ff05e1b2601348d9b11060935f0e7c2fa87419862351dfabfb5c1e5'
            '8d4e73987458eb9d1453c3bfe839a90ea1f5c15a0872ea5a35d0b532231d9194'
            'd5b7c633f99fd1410c35839780a6ac1be2043493b3743e42a0ecfb68fbdb5a72'
            'ff4f6d1cc5734d48dc4675320547a8f9599ddb996ef42039ac7c32284c81d73f'
            'a55dff08d5536a905568aca52b68ae1761af50484255bd79cc74366c09480bc5')

prepare() {
	cd "$pkgname-$pkgver"
	cp ../gzlib.c.new ./zlib/gzlib.c
	cp ../gzread.c.new ./zlib/gzread.c
	cp ../gzwrite.c.new ./zlib/gzwrite.c
}

build() {
	cd "$pkgname-$pkgver"
	qmake6 PREFIX=${pkgdir}/usr -r profex.pro
	make -j 8
}

package() {
	cd ${srcdir}
	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	cd "$pkgname-$pkgver"
	install -Dm644 "profex/icons/${pkgname}5.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	make install
	
  mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/* "${pkgdir}/usr/bin/"

}
