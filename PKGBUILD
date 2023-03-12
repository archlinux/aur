# Maintainer: iFlygo <iflygo@outlook.com>

pkgname=goldendict-qt6-git
pkgver=23.02.07.alpha.230226.656cd373.r23.g5b567909
pkgrel=1
pkgdesc="A feature-rich dictionary lookup program, supporting multiple dictionary formats."
arch=('x86_64')
url="https://github.com/xiaoyifang/goldendict"
url="http://goldendict.org/"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libvorbis' 'libxtst' 'lzo' 'zlib' 'xz' 'opencc'
	 'qt6-svg' 'qt6-tools' 'qt6-multimedia' 'qt6-webengine' 'qt6-5compat')
makedepends=('git' 'cmake' 'ninja')
conflicts=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt')
source=(
	"$pkgname::git+https://github.com/xiaoyifang/goldendict.git"
	"0001-remove-X11.patch"
)
md5sums=(
	'SKIP'
	'8a5a7f3999a96258012a28829eda41ae'
)

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init && git submodule update
	patch -Np1 -i ../0001-remove-X11.patch 
}

build(){
	cd "$srcdir/$pkgname"
	cmake -S . -B build/ -DCMAKE_BUILD_TYPE=Release -G Ninja && cd build/ && ninja -C .
	# cmake --build . -G Ninja
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "${pkgdir}/usr/share/goldendict"
	install -Dm755 build/goldendict -t "${pkgdir}/usr/bin"
	install -Dm644 redist/*.desktop -t "${pkgdir}/usr/share/applications/goldendict.desktop"
	install -Dm755 build/thirdparty/eb/libeb.so -t "${pkgdir}/usr/lib"
}
