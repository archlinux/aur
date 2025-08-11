# Maintainer: Marcello Haddeman <haddemanmarcello@gmail.com>
pkgname=ironwail
pkgver=0.8.0
pkgrel=2
pkgdesc="A fork of the popular GLQuake descendant QuakeSpasm with a focus on high performance instead of maximum compatibility, with a few extra features sprinkled on top."
arch=('i686' 'x86_64')
url="https://github.com/andrei-drexler/ironwail"
license=('GPL2')
depends=('sdl2' 'libvorbis' 'libmad' 'flac')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrei-drexler/ironwail/archive/refs/tags/v$pkgver.tar.gz"
	"launch_ironwail.sh"
	"ironwail.desktop")
md5sums=('800ef0730fd7c464bae806f09ff04c3d'
	 'd9987f6cb32e318dff2e3172da6cc63c'
	 '033814f289ed954599d4ea1da0d2637a')

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	mkdir -p build
	cd build
	cmake ..
	cmake --build .
}

package() {
	# Navigate to launch script
	cd "$srcdir"
	install -Dm755 launch_ironwail.sh "$pkgdir"/usr/bin/$pkgname

	# Navigate to built files
	cd "$pkgname-$pkgver/"

	# Create Destination Directories
	install -d "${pkgdir}"/{usr/bin,/opt/ironwail}

	# Install executable and PAK file
	install -Dm755 build/ironwail "$pkgdir"/opt/$pkgname/ironwail
	install -Dm644 Quake/ironwail.pak "$pkgdir"/opt/$pkgname/ironwail.pak

	# Install icons and desktop file
	for i in 16 24 32 48 64 72; do
		install -Dm644 $srcdir/$pkgname-$pkgver/Misc/QuakeSpasm_512.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/ironwail.png
  	done

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
