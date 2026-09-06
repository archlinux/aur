# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=markterm
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal markdown renderer, plus a fast self-contained Markdown/HTML-to-PDF converter."
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/markterm"
license=('MIT')
makedepends=('crystal' 'shards' 'cmake' 'git')
install=install
_litehtml_rev=587663441c85e0d9229f464894441631b34fc5de
_libharu_ver=2.4.6
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "litehtml-$_litehtml_rev.tar.gz::https://github.com/ralsina/litehtml/archive/$_litehtml_rev.tar.gz"
        "libharu-$_libharu_ver.tar.gz::https://github.com/libharu/libharu/archive/refs/tags/v$_libharu_ver.tar.gz")
optdepends=("timg: image support")
sha256sums=('12d2651124c064acc1905908c63ed2e3593d3ac88f10df062b9ca2fc0203e7ce'
            '1a673ac5e2062aae2b303b181ee4526ff239c4cad011dc998aff7ac9e6fce649'
            'ec8f327520d1d354ce58b5d2af75b64f380cddc522437c169463b39760921348')

prepare() {
	cd "$pkgname-$pkgver"
	# litehtml submodule (ralsina fork: row boxes + draw pruning)
	rm -rf ext/litehtml
	cp -r "$srcdir/litehtml-$_litehtml_rev" ext/litehtml
	# libharu is patched in a neutral directory: this PKGBUILD lives in
	# a git work tree (the AUR repository), and git apply run inside it
	# resolves patch paths against the repository root — silently
	# patching nothing.
	rm -rf /tmp/markpdf-libharu
	cp -r "$srcdir/libharu-$_libharu_ver" /tmp/markpdf-libharu
	(cd /tmp/markpdf-libharu && git apply -p1 "$srcdir/markterm-$pkgver/ext/libharu-cid-fixes.patch")
	# without makepkg's CFLAGS: -flto objects are GCC-only and crystal
	# links through ld.lld, which cannot consume them
	env -u CFLAGS -u CXXFLAGS cmake -S /tmp/markpdf-libharu -B /tmp/markpdf-libharu/build \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DBUILD_SHARED_LIBS=OFF \
		-DLIBHPDF_EXAMPLES=NO -DLIBHPDF_UTILS=NO
	env -u CFLAGS -u CXXFLAGS cmake --build /tmp/markpdf-libharu/build
	find /tmp/markpdf-libharu/build -name 'libhpdf.a' -exec cp {} ext/build/ \;
	mkdir -p ext/build/include
	cp -f /tmp/markpdf-libharu/include/*.h ext/build/include/
	cp -f /tmp/markpdf-libharu/build/include/*.h ext/build/include/
}

build() {
	cd "$pkgname-$pkgver"
	shards install --without-development
	# WITH_TEXMATH=0 skips the GPL libtexprintf submodule: display math
	# falls back to the Unicode styling pass and the license stays MIT.
	# makepkg may inject -flto into CFLAGS: the shim's objects are linked
	# by crystal through ld.lld, which cannot consume GCC LTO objects.
	env -u CFLAGS -u CXXFLAGS make -C ext WITH_TEXMATH=0
	CFLAGS="$CFLAGS -fno-lto" CXXFLAGS="$CXXFLAGS -fno-lto" \
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
