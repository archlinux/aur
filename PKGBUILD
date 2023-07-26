# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng-git
pkgver=23.07.25.r4892.17cd4456
pkgrel=1
pkgdesc="The next generation GoldenDict (Supports Qt WebEngine & Qt6)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xiaoyifang/goldendict-ng"
license=('GPL3')
depends=(
	ffmpeg
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
conflicts=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
source=("$pkgname::git+https://github.com/xiaoyifang/goldendict.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" "$(git describe | cut -c 2-9)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# This flag leads to crashs around Oct 2022, remove this in future.
	export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
}

build(){
	cmake -B build_dir -S "$pkgname" -G Ninja \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_SYSTEM_FMT=ON \
		-DUSE_SYSTEM_TOML=ON \
		-Wno-dev
	cmake --build build_dir
}

package() {
	DESTDIR="$pkgdir" cmake --install ./build_dir/
}
