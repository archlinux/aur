# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit-git
pkgver=3.5.0.r0.g8e153e2
pkgrel=1
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base')
makedepends=('cmake' 'git' 'gcc')
conflicts=('vpkedit' 'vpkedit-bin')
replaces=('vpkedit')
source=("$pkgname::git+$url.git"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"saap::git+https://github.com/Trico-Everfire/SteamAppPathProvider.git"
		"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver(){
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {vtflib,saap,speedykeyv};
	do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/opt/vpkedit

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	cd "$pkgdir/opt/vpkedit"
	rm -rf libQt*
}
