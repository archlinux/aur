# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng
pkgver=23.12.07
true_ver=23.12.07-HeavySnow.b0086d5c
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiaoyifang/goldendict-ng/archive/refs/tags/v${true_ver}.tar.gz")
sha256sums=('9cfdc57d502a253f8ce729744a564a1731b514c0b7c7f3c0ef971e6a90f71854')

prepare() {
	# This flag leads to crashs around Oct 2022, remove this in future.
	export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
}

build(){
	cd "$srcdir/$pkgname-${true_ver}"
	cmake -B build_dir -S . -G Ninja \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_SYSTEM_FMT=ON \
		-DUSE_SYSTEM_TOML=ON \
		-Wno-dev
	cmake --build build_dir
}

package() {
	cd "$srcdir/$pkgname-${true_ver}"
	DESTDIR="$pkgdir" cmake --install ./build_dir/
}
