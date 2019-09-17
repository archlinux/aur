# Maintainer: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=netsurf-fb
pkgver=3.9
pkgrel=1
pkgdesc='Lightweight and fast web browser'
arch=(x86_64 i686)
url=https://www.netsurf-browser.org/
license=(MIT GPL2)
depends=(curl glibc 'libdom>=0.4.0' libjpeg libnsfb 'libnsutils=0.0.5-4' \
	libpng libsvgtiny 'libutf8proc>=2.4.0' libwebp openssl)
makedepends=(check gcc 'libcss>=0.9.0' 'libnsbmp>=0.1.5' 'libnsgif>=0.2.1' \
	make 'nsgenbind>=0.7' patch words xxd)
_download_uri=https://download.netsurf-browser.org/netsurf/releases/source
source=(
	$_download_uri/netsurf-$pkgver-src.tar.gz
	utils-idna.patch
)
sha256sums=(
	'd72f1c6f6113a01e541f8476a93c347235068779140090df55ba402eb4a8ecc3'
	'1c2bb855e1b778bae1234018fa4b138f974a55ee56fd77ec0a21d3fcca487d38'
)
_makedir=$pkgname-$pkgver
_makeopts="-C $_makedir PREFIX=/usr TARGET=framebuffer"

prepare() {
	patch --directory=$_makedir --strip=0 < $startdir/utils-idna.patch
}

build() {
	make $_makeopts
}

check() {
	make $_makeopts test
}

package() {
	local installopts='--mode 0644 -D --target-directory'
	local shrdir="$pkgdir/usr/share"
	local licdir="$shrdir/licenses/$pkgname"
	local docdir="$shrdir/doc/$pkgname"
	local mandir="$shrdir/man/man1"
	install $installopts "$licdir" $_makedir/COPYING
	install $installopts "$docdir" $_makedir/docs/{netsurf-options.md,UnimplementedJavascript.md,using-framebuffer.md}
	gzip $_makedir/docs/netsurf-fb.1
	install $installopts "$mandir" $_makedir/docs/netsurf-fb.1.gz
	make $_makeopts DESTDIR="$pkgdir" install
}
