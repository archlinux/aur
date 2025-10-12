# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit-git
pkgver=5.0.0.3.r5.g504162b
epoch=1
pkgrel=1
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme' 'qt6-svg')
makedepends=('cmake' 'git' 'clang' 'qt6-tools' 'ninja')
optdepends=('qt6-wayland: Wayland support')
conflicts=('vpkedit' 'vpkedit-bin')
replaces=('vpkedit')
source=("$pkgname::git+$url.git"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"argparse::git+https://github.com/p-ranav/argparse.git"
	"indicators::git+https://github.com/p-ranav/indicators.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"miniaudio::git+https://github.com/mackron/miniaudio.git"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
	#discord module
	"git+https://github.com/Tencent/rapidjson.git")
sha256sums=('SKIP'
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
	sed -i '14i #include <QQuaternion>' src/gui/plugins/previews/mdl/MDLPreview.h
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-G Ninja \
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
