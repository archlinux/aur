# Maintainer: Bobby Hamblin <hamblingreen@hotmail.com>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=netsurf-fb
pkgver=3.11
pkgrel=1
pkgdesc='Lightweight and fast web browser (framebuffer front end)'
arch=(x86_64 i686 aarch64)
url=https://www.netsurf-browser.org/
license=(MIT GPL2)
depends=('curl' 'glibc' 'gperf' 'libdom>=0.4.2' 'libhubbub>=0.3.8' 'libjpeg' 'libnsfb' 'libnsutils>=0.1.1' 'libpng' 'libsvgtiny>=0.1.8' 'libutf8proc>=2.9.0' 'libwebp' 'openssl' 'perl-html-parser')
makedepends=('check' 'libcss>=0.9.2' 'libnsbmp>=0.1.7' 'libnsgif>=1.0.0' 'nsgenbind' 'words' 'xxd')
_download_uri=https://download.netsurf-browser.org/netsurf/releases/source
source=(
	$_download_uri/netsurf-$pkgver-src.tar.gz
	utils-idna.patch
)
sha256sums=('c28a626aefee428d053b13f88b5c440922245976522d12eaf137cfd32d201cb2'
            '9b61a26cf2f36d9fd8dbd792624c3aead5a8ebd87e5af367c7ae35993203d316')
_makedir=netsurf-$pkgver
_makeopts="-C $_makedir PREFIX=/usr TARGET=framebuffer"

prepare() {
	# makedepends: patch
	patch --directory=$_makedir --strip=1 < $startdir/utils-idna.patch
}

build() {
	# makedepends: gcc libcss libnsbmp libnsgif make nsgenbind xxd
	make $_makeopts
}

check() {
	# makedepends: check gcc make words
	make $_makeopts test
}

package() {
	# makedepends: coreutils gzip make
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
