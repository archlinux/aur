# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit
pkgver=5.0.0.3
pkgrel=2
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
optdepends=('qt6-wayland: Wayland support')
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'qt6-tools' 'ninja' 'rapidjson' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"argparse::git+https://github.com/p-ranav/argparse.git"
	"indicators::git+https://github.com/p-ranav/indicators.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"miniaudio::git+https://github.com/mackron/miniaudio.git"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
	#discord module
	"git+https://github.com/Tencent/rapidjson.git"
	"mdl.patch")
sha256sums=('b6b8d4bb49afa91c1577c2ecc748c9993f2fd84c465b6cb13da7646e2055af18'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'edac6534038d44cef2be9e66314450e75d1c4414061148974cf2e253d4849cca')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {miniaudio,discord};
	do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	for submodule in {argparse,indicators};
	do
		git config submodule.src/cli/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/shared/thirdparty/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/cmake-helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
	patch -Np1 < "$srcdir/mdl.patch"
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCPACK_GENERATOR=RPM

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
