# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=seriousrunner
pkginstdir=seriousrunner
pkgver=1.1.1
_srcname="Serious-Runner-$pkgver"
pkgrel=2
pkgdesc="Serious Runner program that loads and runs content created by users."
arch=('x86_64')
url="https://github.com/tx00100xt/Serious-Runner"
license=('GPL2')

makedepends=('cmake' 'make' 'sed' 'qt5-base' 'libarchive' 'xz' 'bzip2')
source=("https://github.com/tx00100xt/Serious-Runner/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Fix_system_search_DB.patch")
sha256sums=("530b421aa4fe1fe6fdf0e2ee9ac0f2b00861b28a9f277098b10f20a38fd337e0"
			"148a2ba597789d646678956bf11f3699adc11dfb03aa97f3f11ed429a74e5c25")

prepare(){
	# Prepare patch
	cat 0001-Fix_system_search_DB.patch > "$srcdir/$_srcname/0001-Fix_system_search_DB.patch"
	cd "$srcdir/$_srcname"
	# apply patch
	patch -p1 < 0001-Fix_system_search_DB.patch || return 1
}

build() {
	mkdir "$_srcname"/build && cd "$_srcname"/build
	cmake   -DCMAKE_BUILD_TYPE='Release' \
			-DCMAKE_INSTALL_PREFIX='/usr' \
			-Wno-dev ..
	cd .. && cd ..
	cmake --build "$_srcname"/build
}

check() {
	ctest --test-dir "$_srcname"/build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install "$_srcname"/build
}
