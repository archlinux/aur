# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.12.2
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'qt6-base' 'libstdc++' 'libgcc')
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
sha256sums=('580b21580595c7380c91d9098bbb717f6edc42974f70528bc8ae8dc92f941a61'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
replaces=("vtf-thumbnailer") #vtf-thumbnailer was merged
conflicts=("vtf-thumbnailer")

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {sourcepp,argparse,efsw,indicators,discord};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
	pushd ext/sourcepp

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
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCMAKE_SKIP_INSTALL_RPATH=ON

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
