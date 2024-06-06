# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit-git
pkgver=4.2.2.r0.g8b0c6dd
epoch=1
pkgrel=1
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'gcc')
optdepends=('qt6-wayland: Wayland support')
conflicts=('vpkedit' 'vpkedit-bin')
replaces=('vpkedit')
source=("$pkgname::git+$url.git"
	"argparse::git+https://github.com/p-ranav/argparse.git"
	"saap::git+https://github.com/craftablescience/SteamAppPathProvider.git"
	"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
	"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git"
	"miniaudio::git+https://github.com/mackron/miniaudio.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"indicators::git+https://github.com/p-ranav/indicators.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git"
	#Submodule for submodules
	"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
	"miniz::git+https://github.com/richgel999/miniz.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
	for submodule in {saap,speedykeyv,sourcepp,miniaudio,discord};
	do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/lib/thirdparty/minizip-ng.url "$srcdir/minizip-ng"
	git config submodule.src/cli/thirdparty/indicators.url "$srcdir/indicators"
	git config submodule.src/lib/thirdparty/cryptopp.url "$srcdir/cryptopp"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/gui/thirdparty/sourcepp"
	git submodule init
	git config submodule.src/thirdparty/bufferstream.url "$srcdir/bufferstream"
	git config submoudle.src/thirdparty/miniz.url "$srcdir/miniz"
	git -c protocol.file.allow=always submodule update


}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DVPKEDIT_BUILD_LIBC=OFF

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system
	cd "$pkgdir/usr/lib/$pkgname"
	rm -rf libQt*
	ln -sf "/usr/lib/$pkgname/vpkedit" "$pkgdir/usr/bin/vpkedit"
	ln -sf "/usr/lib/$pkgname/vpkeditcli" "$pkgdir/usr/bin/vpkeditcli"

	# Change desktop file to point towards /usr/lib/vpkedit
	cd "$pkgdir/usr/share/applications"
	sed -i 's/Exec=\/opt\/vpkedit\//Exec=/g' vpkedit.desktop

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
