# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=couchbase-lite-c
pkgver="3.0.6"
pkgrel=1
pkgdesc="C language bindings for the Couchbase Lite embedded NoSQL database engine"
arch=("x86_64")
url="https://www.couchbase.com/products/lite/"
license=('Apache')
depends=(icu zlib)
makedepends=(cmake git)
source=("git+https://github.com/couchbase/${pkgname}#tag=${pkgver}-mp"
				"CMakeLists.diff"
				"StringUtil.diff"
				"catch.diff")
sha256sums=('SKIP'
            '328585e9452b9522f2d23823cd3036a885dff1e8b55f5c52f29db689b89dcc04'
            'ba7e85059f842555233c91763bba8f7b173460ccc2d555f50783ed555a43321a'
            '034f1e91eca7bb6e6b3ac19007de040e01b8f0fbceef34816529a72a64bc2914')

prepare() {
	cd "$pkgname"

	git submodule update --init --recursive

	git apply "${srcdir}/CMakeLists.diff"
	git apply "${srcdir}/StringUtil.diff"
	git apply "${srcdir}/catch.diff"

	mkdir -p build
}

build() {
	cd "$pkgname/build"

	VERSION=${pkgver} cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..

	make
}

package() {
	cd "$pkgname/build"

	make install
}
