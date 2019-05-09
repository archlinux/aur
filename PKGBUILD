# Maintainer: Maxim Devaev <mdevaev@gmail.com>


pkgname=libevent-patched
pkgver=2.1.8
pkgrel=3
pkgdesc="An event notification library (with fix for Issue #807)"
url="https://libevent.org"
license=(BSD)
arch=(i686 x86_64 armv6h armv7h)
provides=(libevent)
conflicts=(libevent)
replaces=(libevent)
depends=(openssl)
optdepends=("python2: to use event_rpcgen.py")
makedepends=(gcc make)
source=(
	"https://github.com/libevent/libevent/archive/release-${pkgver}-stable.tar.gz"
	evhttp-afunix.patch
)
md5sums=(SKIP SKIP)


build() {
	cd "$srcdir/libevent-release-${pkgver}-stable"
	patch -p1 < ../evhttp-afunix.patch
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --disable-libevent-regress
	make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" $MAKEFLAGS
}

check() {
	cd "$srcdir/libevent-release-${pkgver}-stable"
	make -j1 check
}

package() {
	cd "$srcdir/libevent-release-${pkgver}-stable"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/libevent/LICENSE"
}
