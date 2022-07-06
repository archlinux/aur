# Maintainer: entriphy <t4ils.dev@gmail.com>
# Contributor: Liam Greenough <beacon515@gmail.com>

pkgname=obs-websocket-git
pkgver=r665.a25427c
pkgrel=1
pkgdesc="Remote-control of OBS Studio through WebSocket"
arch=('i686' 'x86_64')
url="https://github.com/obsproject/obs-websocket"
license=('GPL2')
depends=('obs-studio')
makedepends=('git' 'cmake' 'asio')
provides=('obs-websocket')
conflicts=('obs-websocket')
source=(
	'git+https://github.com/obsproject/obs-websocket.git#branch=release/5.0.0' # Use release/5.0.0 since master compiles as a submodule for OBS Studio
	'git+https://github.com/obsproject/obs-studio.git'
	'git+https://github.com/chriskohlhoff/asio.git'
	'git+https://github.com/nlohmann/json.git'
	'git+https://github.com/nayuki/QR-Code-generator.git'
	'git+https://github.com/zaphoyd/websocketpp.git'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/obs-websocket"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/obs-websocket"
	git submodule init
	git config submodule."deps/asio".url $srcdir/asio
	git config submodule."deps/json".url $srcdir/json
	git config submodule."deps/qr".url $srcdir/QR-Code-generator
	git config submodule."deps/websocketpp".url $srcdir/websocketpp

	# Checkout all submodules except asio
	# asio is locked to 1.12.0 in the repo due to a bug that only affects MacOS,
	# though causes issues on Linux due to the -Werror flag
	git submodule update deps/json deps/qr deps/websocketpp
}

build() {
	cd "$srcdir/obs-websocket"
	mkdir build || true
	cd build
	cmake -DLIBOBS_INCLUDE_DIR="$srcdir/obs-studio/libobs/" -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j$(nproc)
}

package() {
	cd "$srcdir/obs-websocket/build"
	make DESTDIR="$pkgdir/" install
}
