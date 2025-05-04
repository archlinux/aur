# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=kate-discord-rpc-git
pkgver=r5.1d790ff
pkgrel=1
pkgdesc="Discord RPC Plugin for Kate"
arch=(x86_64)
url="https://github.com/leia-uwu/kate-discord-rpc"
license=('GPL-2.0-only')
depends=('glibc' 'ktexteditor' 'kparts' 'qt6-base' 'kcoreaddons' 'gcc-libs' 'kconfig')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'vulkan-headers' 'rapidjson' 'ninja')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("git+$url.git"
	"git+${url::-16}discord-rpc.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


prepare() {
	cd "$srcdir/${pkgname::-4}"
	git submodule init
	git config submodule.discord-rpc.url "$srcdir/discord-rpc"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -G Ninja \
	-S "${pkgname::-4}" \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
