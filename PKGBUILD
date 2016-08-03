# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=chemdoodle
pkgver=8.1.0
pkgrel=1
pkgdesc="Chemical and Biological Publishing Software"
arch=('i686' 'x86_64')
url="http://www.chemdoodle.com"
license=('custom')
depends=('java-runtime-common'
	 'gtk2'
	 'libxtst'
	 'java-environment'
	 'libxslt'
	 'libxxf86vm'
	 'alsa-lib')
depends_x86_64=('gcc-libs-multilib')
depends_i686=('gcc-libs')
makedepends=('gendesk')
source=("$pkgname.patch")
source_x86_64=("https://www.chemdoodle.com/downloads/ChemDoodle-linux-${pkgver}.bin")
source_i686=("https://www.chemdoodle.com/downloads/ChemDoodle-linux-i586-${pkgver}.bin")
md5sums=('c1643ffbec64d90fa742cb4d1844f769')
md5sums_i686=('e696fe450574d10ae6901a83d53d463f')
md5sums_x86_64=('86e02b29a825b3a2e7a73cd022427faa')

_installer=ChemDoodle

prepare() {
	cd "$srcdir"
	# Create desktop file
	gendesk -f -n --pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--name "ChemDoodle" \
		--genericname "ChemDoodle" \
		--comment "$pkgdesc" \
		--exec /usr/bin/ChemDoodle \
		--categories 'Education;Science;Graphics;Office;Application;'

	# Edit launcher file to execute appropriately
	patch -Np0 < $pkgname.patch
}

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	
	cd "$srcdir/$_installer"
	install -Dm755 "ChemDoodle" "$pkgdir/usr/bin/ChemDoodle"
	install -Dm644 "resources/ChemDoodle.png" \
		"$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "external/Licenses/Licenses.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
	install -Dm644 "ChemDoodle.jar" \
		"$pkgdir/opt/ChemDoodle/ChemDoodle.jar"

	cp -R {njre,docs,external,resources,config} \
		$pkgdir/opt/ChemDoodle/
	find $pkgdir/opt/ChemDoodle/ -type f -exec chmod 644 {} \;
	find $pkgdir/opt/ChemDoodle/ -type d -exec chmod 755 {} \;
}
