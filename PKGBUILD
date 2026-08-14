# Maintainer: Seraphim Pardee <me at srp dot life>
pkgname=ironwail-git
pkgver=0.8.2.r0.g1eabd0df
pkgrel=1
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
source=("git+https://github.com/andrei-drexler/ironwail"
	"launch_ironwail.sh"
	"ironwail.desktop")
md5sums=('SKIP'
     '0c943dae2a004295e70ec0310f9b2039'
	 '033814f289ed954599d4ea1da0d2637a')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/"
	mkdir -p build
	cd build
	cmake ..
	cmake --build .
}

package() {
	# Navigate to launch script
	cd "$srcdir/$pkgname"
	install -Dm755 $srcdir/launch_ironwail.sh "$pkgdir"/usr/bin/$pkgname

	# Navigate to built files
	cd "$srcdir/$pkgname/"

	# Create Destination Directories
	install -d "${pkgdir}"/{usr/bin,/opt/ironwail}

	# Install executable and PAK file
	install -Dm755 build/ironwail "$pkgdir"/opt/$pkgname/ironwail
	install -Dm644 Quake/ironwail.pak "$pkgdir"/opt/$pkgname/ironwail.pak

	# Install icons and desktop file
	for i in 16 24 32 48 64 72; do
		install -Dm644 $srcdir/$pkgname/Misc/QuakeSpasm_512.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/ironwail.png
  	done

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
