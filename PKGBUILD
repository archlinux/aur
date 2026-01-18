# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.9.2
pkgrel=3
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'qt6-base')
makedepends=('ninja' 'cmake' 'git' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"git+https://github.com/craftablescience/sourcepp.git"
	"git+https://github.com/p-ranav/argparse.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"git+https://github.com/SpartanJ/efsw.git"
	"git+https://github.com/p-ranav/indicators.git"
	"git+https://github.com/Tencent/rapidjson.git"
	)
sha256sums=('e3bd7b5188f3be7db4f58c611208e965f1aaf39358c31b6166be56c6e3727e8d'
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
	for submodule in {sourcepp,argparse,efsw,indicators,discord};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/discord"
	git submodule init
	git config submodule.thirdparty/rapidjson.url "$srcdir/rapidjson"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DMARETF_BUILD_INSTALLER=ON \
	-DCPACK_GENERATOR=RPM \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
