# Maintainer: Marcello Haddeman <haddemanmarcello@gmail.com>
pkgname=ironwail
pkgver=0.8.2
pkgrel=2
pkgdesc="A fork of the popular GLQuake descendant QuakeSpasm with a focus on high performance instead of maximum compatibility, with a few extra features sprinkled on top."
arch=('i686' 'x86_64')
url="https://github.com/andrei-drexler/ironwail"
license=('GPL2')
depends=('sdl2'
	 'libvorbis'
	 'libmad'
	 'flac'
	 'libxmp')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrei-drexler/ironwail/archive/refs/tags/v$pkgver.tar.gz"
	"launch_ironwail.sh"
	"ironwail.desktop")
md5sums=('6abd1dff4eeceaabada1eeb6361c3394'
	 '96cbfcc4b5e2098d1171abeeffa74401'
	 'a7e88984a3acffe7c35247a65d551a3c')

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
