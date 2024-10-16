# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng
pkgver=24.09.0
true_ver=24.09.0-Release.316ec900
pkgrel=4
pkgdesc="The next generation GoldenDict (Supports Qt WebEngine & Qt6)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xiaoyifang/goldendict-ng"
license=('GPL3')
depends=(
	hunspell
	libvorbis
	libxtst
	lzo
	zlib
	xz
	libeb
	tomlplusplus
	fmt
	opencc
	xapian-core
	libzim
	qt6-base
	qt6-svg
	qt6-multimedia
	qt6-webengine
	qt6-speech
	qt6-5compat
	)
makedepends=(
	git
	cmake
	ninja
	qt6-tools
)
conflicts=('goldendict' 'goldendict-git' 'goldendict-ng-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiaoyifang/goldendict-ng/archive/refs/tags/v${true_ver}.tar.gz"
	    "fix-qt6.8-build.patch")
sha256sums=('528af2f7079a1cffad8b9451c722b3de80ecff6e33972f896c015058c88cd8be'
	        '0f95aa8a90f6b23b8372e662158a7282858b2b46825f5eb3357a485d6d72bbe0')

prepare() {
	# This flag leads to crashs around Oct 2022, remove this in future.
	export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"

	cd "$srcdir/$pkgname-${true_ver}"
	patch -p1 -i "${srcdir}/fix-qt6.8-build.patch"
}

build(){
	cd "$srcdir/$pkgname-${true_ver}"
	cmake -B build_dir -S . -G Ninja \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_SYSTEM_FMT=ON \
		-DUSE_SYSTEM_TOML=ON \
		-DWITH_FFMPEG_PLAYER=OFF \
		-Wno-dev
	cmake --build build_dir
}

package() {
	cd "$srcdir/$pkgname-${true_ver}"
	DESTDIR="$pkgdir" cmake --install ./build_dir/
}
