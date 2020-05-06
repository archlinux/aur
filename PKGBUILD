pkgname=xabber-websocket
pkgver=0.3.1
pkgrel=1
pkgdesc="WebSocket XMPP client interface"
arch=(i686 x86_64)
url="https://github.com/redsolution/xabber-websocket/"
license=('GPL')
depends=()
makedepends=('git')
source=("git://github.com/redsolution/xabber-websocket/#tag=${pkgver}"
	"xabber_ws.service")
sha256sums=('SKIP'
            'f6fab136e5daa9bad3631e5c2f24f99892d9ad331a14d2ce9e5734e0457e2c52')

build() {
	cd "$pkgname"
	make -j1 fetch-deps
	make -j1
}

package() {
	cd "$pkgname"
	install -dm0755 "$pkgdir"/usr/{bin,lib/xabber_ws}
	install -dm0755 "$pkgdir"/etc
	tar -C "$pkgdir"/usr/lib/xabber_ws -xzf _rel/xabber_ws/xabber_ws-$pkgver.tar.gz

	mv "$pkgdir"/usr/lib/xabber_ws/config "$pkgdir"/etc/xabber_ws
	ln -s /etc/xabber_ws "$pkgdir"/usr/lib/xabber_ws/config

	install -dm0755 -o nobody -g nobody "$pkgdir"/var/log/xabber_ws
	ln -s /var/log/xabber_ws "$pkgdir"/usr/lib/xabber_ws/log

	echo -e "#!/bin/sh\n/usr/lib/xabber_ws/bin/xabber_ws \$@" >"$pkgdir"/usr/bin/xabber_ws
	chmod a+x "$pkgdir"/usr/bin/xabber_ws
	chmod a+x "$pkgdir"/usr/lib/xabber_ws/erts-10.6.4/bin/*

	install -Dm0644 "$srcdir"/xabber_ws.service "$pkgdir"/usr/lib/systemd/system/xabber_ws.service
}
