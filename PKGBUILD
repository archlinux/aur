# Maintainer: 4679kun <admin@libnull.com>

pkgname=sni-ssl-proxy-git
_pkgname=SNI-SSL-Proxy
pkgver=r16.cb5cb6d
pkgrel=1
pkgdesc="SNI-Proxy-Server HTTP/HTTPs/IMAPs/POP3s/SMTPs Supporting Upstream Socks (based on puxxustc/sniproxy)"
arch=(i686 x86_64)
url="https://github.com/Intika-Linux-Proxy/SNI-SSL-Proxy/"
license=(GPLv3)
conflicts=(sniproxy)
depends=(glibc)
makedepends=(autoconf make)
source=($_pkgname::git+https://github.com/Intika-Linux-Proxy/SNI-SSL-Proxy.git
		libmill::git+https://github.com/sustrik/libmill.git
		sniproxy.service)
sha256sums=('SKIP'
			'SKIP'
            'def472f0fe30bdf79e61ce77597b7005b32896c8435db839eda21c56e2d5c5e9')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g'
  )
}

build() {
	cd "$srcdir/libmill"
	./autogen.sh
	./configure --enable-shared=false
	make libmill.la
	cd "$srcdir/$_pkgname"
	autoreconf -if
	export CPPFLAGS=-I$srcdir/libmill
	export LDFLAGS=-L$srcdir/libmill/.libs
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make check
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm0644 $srcdir/sniproxy.service $pkgdir/usr/lib/systemd/system/sniproxy.service
}
