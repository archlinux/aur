# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=markterm
pkgver=0.16.0
pkgrel=1
pkgdesc="Terminal markdown renderer, plus a fast self-contained Markdown/HTML-to-PDF converter."
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/markterm"
license=('MIT')
makedepends=('crystal' 'shards' 'cmake' 'git')
install=install
_litehtml_rev=587663441c85e0d9229f464894441631b34fc5de
_microtex_rev=0e3707f6dafebb121d98b53c64364d16fefe481d
_libharu_ver=2.4.6
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "litehtml-$_litehtml_rev.tar.gz::https://github.com/ralsina/litehtml/archive/$_litehtml_rev.tar.gz"
        "microtex-$_microtex_rev.tar.gz::https://github.com/NanoMichael/MicroTex/archive/$_microtex_rev.tar.gz"
        "libharu-$_libharu_ver.tar.gz::https://github.com/libharu/libharu/archive/refs/tags/v$_libharu_ver.tar.gz")
optdepends=("timg: image support")
sha256sums=('143c265d9ac4441fe40d86feda4c7c4fce71636cb0b6e04331b027310808116b'
            '1a673ac5e2062aae2b303b181ee4526ff239c4cad011dc998aff7ac9e6fce649'
            '47476269d29c41df322bce6bdd2daa7017cc50b9eda841b2bec1767dba28daa6'
            'ec8f327520d1d354ce58b5d2af75b64f380cddc522437c169463b39760921348')

prepare() {
	cd "$pkgname-$pkgver"
	# litehtml submodule (ralsina fork: row boxes + draw pruning)
	rm -rf ext/litehtml
	cp -r "$srcdir/litehtml-$_litehtml_rev" ext/litehtml
	# microtex submodule (MIT math engine: sources compiled, res tree
	# embedded into the static library by ext/gen-math-res.sh).
	# NB: the archive extracts as MicroTeX — GitHub canonicalized the
	# repo name's casing, and this copy is case-sensitive.
	rm -rf ext/microtex
	cp -r "$srcdir/MicroTeX-$_microtex_rev" ext/microtex
	# libharu is patched in a neutral directory: this PKGBUILD lives in
	# a git work tree (the AUR repository), and git apply run inside it
	# resolves patch paths against the repository root — silently
	# patching nothing.
	rm -rf /tmp/markpdf-libharu
	cp -r "$srcdir/libharu-$_libharu_ver" /tmp/markpdf-libharu
	# Both patches apply to pristine v2.4.6; the ActualText marked
	# content (math LaTeX as PDF text) is generated against the
	# CID-patched tree, so the order matters.
	(cd /tmp/markpdf-libharu && git apply -p1 "$srcdir/markterm-$pkgver/ext/libharu-cid-fixes.patch")
	(cd /tmp/markpdf-libharu && git apply -p1 "$srcdir/markterm-$pkgver/ext/libharu-actualtext.patch")
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
