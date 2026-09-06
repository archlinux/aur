# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=markterm
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal markdown renderer, plus a fast self-contained Markdown/HTML-to-PDF converter."
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/markterm"
license=('MIT')
makedepends=('crystal' 'shards' 'cmake')
install=install
_litehtml_rev=587663441c85e0d9229f464894441631b34fc5de
_libharu_ver=2.4.6
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "litehtml-$_litehtml_rev.tar.gz::https://github.com/ralsina/litehtml/archive/$_litehtml_rev.tar.gz"
        "libharu-$_libharu_ver.tar.gz::https://github.com/libharu/libharu/archive/refs/tags/v$_libharu_ver.tar.gz")
optdepends=("timg: image support")
sha256sums=('9ead94ecb90b456fd56372b113a4d1a28d0a871759e5ae48092ac3dd7cc47e9d'
            '1a673ac5e2062aae2b303b181ee4526ff239c4cad011dc998aff7ac9e6fce649'
            'ec8f327520d1d354ce58b5d2af75b64f380cddc522437c169463b39760921348')

prepare() {
	cd "$pkgname-$pkgver"
	# litehtml submodule (ralsina fork: row boxes + draw pruning)
	rm -rf ext/litehtml
	cp -r "$srcdir/litehtml-$_litehtml_rev" ext/litehtml
	# static patched libharu: the shim's emoji/CJK support needs the
	# CID fixes the patch carries
	mkdir -p ext/build
	cp -r "$srcdir/libharu-$_libharu_ver" ext/build/libharu
	patch -d ext/build/libharu -p1 < ext/libharu-cid-fixes.patch
	cmake -S ext/build/libharu -B ext/build/libharu/build \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DBUILD_SHARED_LIBS=OFF \
		-DLIBHPDF_EXAMPLES=NO -DLIBHPDF_UTILS=NO
	cmake --build ext/build/libharu/build
	find ext/build/libharu/build -name 'libhpdf.a' -exec cp {} ext/build/ \;
	mkdir -p ext/build/include
	cp -f ext/build/libharu/include/*.h ext/build/include/
	cp -f ext/build/libharu/build/include/*.h ext/build/include/
}

build() {
	cd "$pkgname-$pkgver"
	shards install --without-development
	# WITH_TEXMATH=0 skips the GPL libtexprintf submodule: display math
	# falls back to the Unicode styling pass and the license stays MIT
	make -C ext WITH_TEXMATH=0
	WITH_TEXMATH=0 shards build --without-development --release
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm755 bin/markmark $pkgdir/usr/bin/markmark
	install -Dm755 bin/markpdf $pkgdir/usr/bin/markpdf
}
