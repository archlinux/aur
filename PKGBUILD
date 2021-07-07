# Maintainer: encadyma <encadyma.hi at gmail dot com>
# Maintainer: Amy <amy at fluff dot tech>

_pkgexec=usc-game
pkgname=unnamed-sdvx-clone
_pkgnum='0.5.0'
pkgver="v$_pkgnum"
pkgrel=1

pkgdesc='A game based on K-Shoot MANIA and Sound Voltex'
arch=('x86_64')
license=('MIT')
url='https://github.com/Drewol/unnamed-sdvx-clone'

depends=('freetype2>=2.6.5'
	 'libogg'
	 'libvorbis'
	 'sdl2>=2.0.9'
	 'zlib'
	 'libpng>=1.6'
	 'libjpeg'
	 'libarchive>=3.3.3'
	 'mesa'
	 'openssl')
install="$pkgname.install"
makedepends=(cmake git)

conflicts=(unnamed-sdvx-clone-git)

source=(
	"$pkgname::git+https://github.com/Drewol/unnamed-sdvx-clone.git#tag=$pkgver"
)

sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/opt/$pkgname"
	cp -a "bin/." "$pkgdir/opt/$pkgname"

	# chmod 755 the executable
	chmod 755 "$pkgdir/opt/$pkgname/$_pkgexec"

	# Copy the license
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	# Link the binary to /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$_pkgexec" "$pkgdir/usr/bin/$_pkgexec"

	chmod 777 "$pkgdir/opt/$pkgname"
	chmod 777 "$pkgdir/opt/$pkgname/skins"
	chmod 777 "$pkgdir/opt/$pkgname/skins/Default"
}
