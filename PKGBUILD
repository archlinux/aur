# Maintainer: Riedler <dev@riedler.wien>

_pkgname=liblsdj
pkgname=${_pkgname}-git
pkgver=2.2.0_457
pkgrel=2
changelog=CHANGELOG
pkgdesc='Library for working with the LSDj save file format'
arch=('any')
url='https://github.com/stijnfrishert/libLSDJ'
license=('MIT')
provides=('lsdsng-export' 'lsdsng-import' 'lsdj-mono' 'lsdj-wavetable-import')
depends=()
makedepends=('cmake' 'git' 'git-lfs')
source=("$_pkgname::git+$url.git"
		'cmake4.patch')
sha256sums=('SKIP' '91054b22c5afd64693c3cedb392f618c3c59bb126698e3c0887e4f6a498b81be')

pkgver() {
    cd $_pkgname
    printf "%s_%s" "$(git describe --tags --abbrev=0 | tail -c+2)" "$(git rev-list --count HEAD)"
}

prepare() {
	cd $_pkgname
	
	# fixes compatibility with cmake>4
	# see: https://github.com/stijnfrishert/libLSDJ/pull/108/
	git apply -3 "$srcdir"/cmake4.patch
	
	msg2 "update submodules..."
	git submodule update --init --depth 1
	msg2 "prepare build using cmake..."
	mkdir build -p
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	msg2 "victory!"
}

build() {
	cd $_pkgname
	cmake --build build --config Release
}

package() {
	cd $_pkgname/build
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