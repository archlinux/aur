# Maintainer: Cody P Schafer <aur@codyps.com>
pkgname=librevault-git
pkgver=0.1.18.5.r0.86a6aef
pkgrel=2
pkgdesc="File synchronization designed with privacy in mind"
arch=(x86_64 i686)
url="https://librevault.com/"
license=('GPL')
groups=()
makedepends=('git' 'cmake' 'boost')
depends=('qt5-websockets' 'protobuf3>=3.0.0-1' 'boost-libs' 'crypto++')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	'librevault::git+https://github.com/Librevault/librevault.git'
	'common::git+https://github.com/Librevault/librevault-common.git'
	'dir_monitor::git+https://github.com/Librevault/dir_monitor.git'
	'spdlog::git+https://github.com/Librevault/spdlog.git'
	'docopt::git+https://github.com/Librevault/docopt.cpp.git'
	'rabin::git+https://github.com/Librevault/rabin.git'
	'libnatpmp::git+https://github.com/Librevault/libnatpmp.git'
	'websocketpp::git+https://github.com/Librevault/websocketpp'
	'dht::git+https://github.com/Librevault/dht.git'
	'miniupnp::git+https://github.com/Librevault/miniupnp.git'
)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
         'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p build
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.common.url "$srcdir/common"
	git config submodule.contrib/dir_monitor.url "$srcdir/dir_monitor"
	git config submodule.contrib/spdlog.url "$srcdir/spdlog"
	git config submodule.contrib/docopt.url "$srcdir/docopt"
	git config submodule.contrib/rabin.url "$srcdir/rabin"
	git config submodule.contrib/libnatpmp.url "$srcdir/libnatpmp"
	git config submodule.contrib/websocketpp.url "$srcdir/websocketpp"
	git config submodule.contrib/dht.url "$srcdir/dht"
	git config submodule.contrib/miniupnp.url "$srcdir/miniupnp"
	git submodule update
}

build() {
	cd build
	cmake "$srcdir/${pkgname%-git}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
