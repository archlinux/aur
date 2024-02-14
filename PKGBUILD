# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit
pkgver=4.0.1
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'gcc')
optdepends=('qt6-wayland: Wayland support')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
		"argparse::git+https://github.com/p-ranav/argparse"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"saap::git+https://github.com/Trico-Everfire/SteamAppPathProvider.git"
		"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git"
		"studiomodelpp::git+https://github.com/craftablescience/studiomodelpp.git"
		"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
		"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {vtflib,saap,speedykeyv,studiomodelpp};
	do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/lib/thirdparty/minizip-ng.url "$srcdir/minizip-ng"
	git -c protocol.file.allow=always submodule update


	cd "$srcdir/$pkgname/src/gui/thirdparty/studiomodelpp/"
	git submodule init
	git config submodule.src/thirdparty/bufferstream.url "$srcdir/bufferstream"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/opt/vpkedit \
	-DCMAKE_BUILD_TYPE=Release

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system
	cd "$pkgdir/opt/vpkedit"
	rm -rf libQt*

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
