# Maintainer: Aditya Mishra <https://github.com/pegvin/csprite/issues>
pkgname=csprite-git
pkgver=0.1.0.r464.g8652b75
pkgrel=1 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a tiny pixel art tool"
arch=('i686' 'x86_64')
url="https://github.com/pegvin/csprite"
license=('MIT')
depends=(sdl2)
makedepends=(git make scons pkg-config python python-pillow python-numpy)
optdepends=()
provides=('csprite-git')
conflicts=('csprite' 'csprite-git' 'csprite-bin')
source=(git+https://github.com/pegvin/csprite.git)
sha512sums=(SKIP)

pkgver() {
	cd csprite
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	if ! command nproc --help &> /dev/null; then
		echo "'nproc' could not be found, cannot determine cpu cores, using 4."
		NUM_CPU=4
	else
		NUM_CPU=$(nproc --all)
	fi

    cd csprite
    git submodule update --init --recursive
	make gen-assets
	make all BUILD_TARGET=release SDL2_STATIC_LINK=0 --jobs $NUM_CPU
}

package() {
    cd csprite
	install -Dm644 data/csprite.desktop "$pkgdir/usr/share/applications/csprite.desktop"
	install -Dm644 data/icon-scaled.png "$pkgdir/usr/share/icons/csprite.png"
	install -Dm755 csprite "$pkgdir/usr/bin/csprite"
}

