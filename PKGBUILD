# Maintainer: Yuki Joou <yukijoou@kemonomimi.gay>
pkgname=axmldec
pkgver=1.2.0
pkgrel=2
pkgdesc="Stand-alone binary AndroidManifest.xml decoder"
arch=(x86_64)
url="https://github.com/ytsutano/axmldec"
license=('ISC')
depends=('boost' 'zlib' 'minizip-ng')
makedepends=('cmake' 'doxygen')
source=("git+${url}"
		"minizip-use-largefile-source.patch")
sha256sums=('SKIP'
            '26505f6e816ec34a2c1b0dcab41425be263ab4cabdb1005c5991cf274ba8d88f')

prepare() {
	cd "$srcdir"/"$pkgname"
	git submodule update --init --recursive
	git checkout "v${pkgver}"
	pushd external/minizip
	git apply ../../../../minizip-use-largefile-source.patch
	popd
	mkdir build/
	cd build/
	cmake -DCMAKE_BUILD_TYPE=Release ..
}

build() {
	cd "$srcdir"/"$pkgname"/build
	make
}

package() {
	cd "$srcdir"/"$pkgname"/build
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/axmldec"
}
