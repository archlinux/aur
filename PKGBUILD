# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit
pkgver=4.4.2
pkgrel=4
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
optdepends=('qt6-wayland: Wayland support')
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'qt6-tools' 'ninja' 'rapidjson' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"argparse::git+https://github.com/p-ranav/argparse.git#commit=d924b84eba1f0f0adf38b20b7b4829f6f65b6570"
	"indicators::git+https://github.com/p-ranav/indicators.git#commit=ac6c93ea2b1f97a220d10a0729a625b3f51e320b"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git#commit=45f36ee0615bca5be496f1cc2e62b7774fd21324"
	"miniaudio::git+https://github.com/mackron/miniaudio.git#commit=350784a9467a79d0fa65802132668e5afbcf3777"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git#commit=5bb0e05abe035410634f5510984527c5a8f5af45"
	#Submodule for submodules
	"rapidjson::git+https://github.com/Tencent/rapidjson.git#commit=24b5e7a8b27f42fa16b96fc70aade9106cf7102f"
	"doxygen-awesome-css::git+https://github.com/jothepro/doxygen-awesome-css.git#commit=28ed396de19cd3d803bcb483dceefdb6d03b1b2b"
	"bufferstream::git+https://github.com/craftablescience/BufferStream.git#commit=dd9bf972b62d384ea3d3dc3b1a95a101134fbfdc"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git#commit=d2b072ab65c036f3dca67f4204ad57d66728bf99"
	"hat-trie::git+https://github.com/Tessil/hat-trie.git#commit=25fdf359711eb27e9e7ec0cfe19cc459ec6488d7"
	"miniz::git+https://github.com/richgel999/miniz.git#commit=2fa13ca8a3cf196345001c9fe17bf42ee32c00f9"
	"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git#commit=fe5fedc365f7824ada0cf9a84fb79b30d5fc97a8")
sha256sums=('50100fc468b35923ee91b058de31cbb3bbfa44e7f62c0a2a0051207233a2b198'
            '42b2b012a0724cfe279a79a520e63602d0dc7d549e8e56ea626018ffcc3f0bc9'
            'd49d1ac49a3b3686c5661ceb6faae3362412f0af197da5f8d1d778a180078ffc'
            '0d3b99c83877d433a793e2d1f60dcc2b376c40561ffc4276c7a3ca836afbe6df'
            'ea102d1857e87f6ac56d2c9064e9afabcd3c314965d1ab5d82d52190f58944dc'
            '76d5b98ca1fad25b79cde731da8e23c73722838bff3df4de4c4c6a96e9d8f16a'
            '22638c58cd876ca7e19ae975346f0871c2b582d2a6d9d7f0d26c6ac423e5367f'
            '02874cd62ece91bc2f3835af6f006fac209a2b42e561bed7eaa943306c822ff5'
            'e8008342673c958a5c9ef92bb170be45cd7bde666d791fe05e5fd5b54350088d'
            '98519577bcf8da800abab6938c2dbd50d6ffd9c4f7a1fd2bb931a4184a30e018'
            '8f71a0140aab6196d1d841b1a572115e5794f9c81cf5ce86eb482fbb45ed3751'
            '2e33c5b29ec580fea1551d7effdbc44756de62ee109fbcab5947eacbd2aa62f1'
            'f4c388042d4911e625f02ac6a7bef0bf5b2fca2227c6ed7ec64c65ade98e33d0')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {miniaudio,discord}; do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/cli/thirdparty/indicators.url "$srcdir/indicators"
	git config submodule.src/shared/thirdparty/sourcepp.url "$srcdir/sourcepp"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/gui/thirdparty/discord"
	git submodule init
	git config submodule.thirdparty/rapidjson.url "$srcdir/rapidjson"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/shared/thirdparty/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,miniz,minizip-ng}; do
		git config submodule.ext/${submodule}.url "$srcdir/${submodule}"
	done
	git config submodule.docs/layout/doxygen-awesome-css.url "$srcdir/doxygen-awesome-css"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

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
