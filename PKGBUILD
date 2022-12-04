# Maintainer: Riedler <dev@riedler.wien>

_pkgname=liblsdj
pkgname=${_pkgname}-git
pkgver=2.1.0
pkgrel=1
changelog=CHANGELOG
pkgdesc='Library for working with the LSDj save file format'
arch=('any')
url='https://github.com/stijnfrishert/libLSDJ'
license=('MIT')
provides=('lsdsng-export' 'lsdsng-import' 'lsdj-mono' 'lsdj-wavetable-import')
depends=()
makedepends=('cmake' 'git')
source=("$_pkgname::git+https://github.com/stijnfrishert/libLSDJ.git"
		"Catch2::git+https://github.com/catchorg/Catch2.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd $_pkgname
	echo "init"
	git submodule init dependency/Catch2
	echo "url"
	git config submodule.Catch2.url "$srcdir/Catch2"
	echo "update"
	git submodule update --init
	echo "rest"
	mkdir build -p
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	echo "victory!"
}

build() {
	cd $_pkgname
	cmake --build build --config Release
}

package() {
	cd $_pkgname
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	cd build
	install -Dm755 "./lsdsng_export/lsdsng-export" \
		-t "$pkgdir/usr/bin/"
	install -Dm755 "./lsdsng_import/lsdsng-import" \
		-t "$pkgdir/usr/bin/"
	install -Dm755 "./lsdj_wavetable_import/lsdj-wavetable-import" \
		-t "$pkgdir/usr/bin/"
	install -Dm755 "./lsdj_mono/lsdj-mono" \
		-t "$pkgdir/usr/bin/"
	install -Dm755 "./liblsdj/liblsdj.a" \
		-t "$pkgdir/usr/lib/"
}

check() {
	$_pkgname/build/liblsdj/test/test
}