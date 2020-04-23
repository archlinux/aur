# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>

pkgname=chemdoodle
pkgver=10.3.0
pkgrel=1
pkgdesc="Chemical and Biological Publishing Software (Trial)"
arch=('x86_64')
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
source=("https://www.ichemlabs.com/downloads/ChemDoodle-linux-${pkgver}.bin"
	"$pkgname.patch")
sha256sums=('5680f50918c547ef97f378e2c6f6a30bda7cf78e50df003c05fda3c1f076e16b'
         	'dbcc36658f1b8143a6b3bbcdb04b4ac94a485b92e48a0de83410d1fc21f37ef8')
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

  cp -R {docs,external,resources,config} \
 	$pkgdir/opt/ChemDoodle/
  find $pkgdir/opt/ChemDoodle/ -type f -exec chmod 644 {} \;
  find $pkgdir/opt/ChemDoodle/ -type d -exec chmod 755 {} \;
}