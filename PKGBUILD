# Maintainer: Bailey Kasin <bailey@gingertechnology.net>

pkgname=vba-rr-git
pkgver=24.4.0.r1.g18e02ad
pkgrel=1
epoch=1
pkgdesc="Visual Boy Advance with lua scripting support."
arch=('x86_64')
url="https://github.com/vba-rerecording/vba-rerecording"
license=('GPL2')
depends=(
        'lua51'
        'lua51-socket'
        'git'
	'sdl'
	'libpng12'
)
makedepends=(
	'cmake'
	'flex'
	'bison'
	'zlib'
)
source=(
	'vba-rr::git+https://github.com/vba-rerecording/vba-rerecording.git'
	'lua51-fix.patch'
)
sha256sums=(
	'SKIP'
	'05cd9b87ab0e5c8fcf499a96ca9334632e08675af50aa7c947a9e3f8dc3163a2'
)

pkgver() {
	cd vba-rr
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -p0 < "${srcdir}/lua51-fix.patch"
	cd vba-rr

	rm -rf build
	mkdir build
}

build() {
	cd vba-rr/build

	_cmakeargs=(-DCMAKE_INSTALL_PREFIX='/usr'
		    -DCMAKE_SKIP_RPATH='TRUE'
		    -DENABLE_FFMPEG='TRUE')
	
	cmake -DCMAKE_BUILD_TYPE=Release "${_cmakeargs[@]}" ..
	make
}

package() {
	cd vba-rr/build

	make DESTDIR="$pkgdir"/ install
	install -m 755 vba-rr "${pkgdir}"/usr/bin
}
