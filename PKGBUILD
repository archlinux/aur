# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit
pkgver=4.2.3
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
optdepends=('qt6-wayland: Wayland support')
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'clang' 'qt6-tools')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"argparse::git+https://github.com/p-ranav/argparse.git"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
	"miniaudio::git+https://github.com/mackron/miniaudio.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"indicators::git+https://github.com/p-ranav/indicators.git"
	"fgdpp.patch::https://github.com/craftablescience/sourcepp/pull/12.patch"
	#Submodule for submodules
	"doxygen-awesome-css::git+https://github.com/jothepro/doxygen-awesome-css.git"
	"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
	"miniz::git+https://github.com/richgel999/miniz.git"
	"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git")
sha256sums=('bf3d1fdd7279fbba120125e44344d1dd94b50309f66084086654753d289fc752'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2d93c9f4b9ec621478ff5d3cb3d94fb527cd982a3678d828ffd1c7c2dd8aac24'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {miniaudio,discord}; do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/cli/thirdparty/indicators.url "$srcdir/indicators"
	git config submoudle.src/shared/thirdparty/sourcepp.url "$srcdir/sourcepp"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/shared/thirdparty/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,miniz,minizip-ng}; do
		git config submodule.ext/${submodule}.url "$srcdir/${submodule}"
	done
	git config submodule.docs/layout/doxygen-awesome-css.url "$srcdir/doxygen-awesome-css"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/shared/thirdparty/sourcepp"
	patch -p1 < "$srcdir/fgdpp.patch"
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system, and propperly symlink
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
