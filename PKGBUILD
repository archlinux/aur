# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit
pkgver=5.0.0.4
pkgrel=3
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
optdepends=('qt6-wayland: Wayland support')
license=('MIT')
depends=('libgcc' 'libstdc++' 'glibc' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'qt6-tools' 'ninja' 'rapidjson' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/cmake-helpers.git#commit=222dc03de5333bf9d3c2e7d15fcf8f1fbb28df2b"
	"argparse::git+https://github.com/p-ranav/argparse.git#commit=d924b84eba1f0f0adf38b20b7b4829f6f65b6570"
	"indicators::git+https://github.com/p-ranav/indicators.git#commit=3872f37abd90d7557bac5f834bfb45bd6c75259a"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git#commit=45f36ee0615bca5be496f1cc2e62b7774fd21324"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git#commit=175e93da4803f563d2c4261680eebec612df6c0d"
	#discord module
	"git+https://github.com/Tencent/rapidjson.git#commit=24b5e7a8b27f42fa16b96fc70aade9106cf7102f")
sha256sums=('78946127cbbb10bfe83cdbd2101e4cc408fa380ec0ac0e262e61625156bcba2c'
            '36987619293b245eb17d98c7c4e454f6b7801678daaf1e6afe0617c2618d400f'
            '42b2b012a0724cfe279a79a520e63602d0dc7d549e8e56ea626018ffcc3f0bc9'
            '91c88da51a60cf533a95aaa0838cfba311a00579c3377a11ccf32141dc93eb93'
            '0d3b99c83877d433a793e2d1f60dcc2b376c40561ffc4276c7a3ca836afbe6df'
            '9d457cb5bcff4029c7c31a9c1057c625be629983b8fed4be072fc4303d9cf641'
            '22638c58cd876ca7e19ae975346f0871c2b582d2a6d9d7f0d26c6ac423e5367f')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.src/gui/thirdparty/discord.url "$srcdir/discord"
	for submodule in {argparse,indicators};
	do
		git config submodule.src/cli/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/shared/thirdparty/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/cmake-helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
	cd "$srcdir/$pkgname/ext/gui/discord"
	git submodule init
	git config submodule.thirdparty/rapidjson.url "$srcdir/rapidjson"
	git -c protocol.file.allow=always submodule update
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
