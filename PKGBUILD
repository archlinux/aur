pkgname=xabber-websocket
pkgver=0.1
pkgrel=1
_commit=d4d1c01d116ef84081ef21c33b456b5e59ef0930
pkgdesc="WebSocket XMPP client interface"
arch=(i686 x86_64)
url="https://github.com/redsolution/xabber-websocket/"
license=('GPL')
depends=()
makedepends=('git')
source=("git://github.com/redsolution/xabber-websocket/#commit=${_commit}"
	"xabber_ws.service")
sha256sums=('SKIP'
            'a3ca5be42008bd67e3af8e094732fd6f58b70222998679e3de7b0a9abce07d75')

build() {
	cd "$pkgname"
	make rel
}

package() {
	cd "$pkgname"
	install -dm0755 "$pkgdir"/usr/{bin,lib/xabber_ws}
	tar -C "$pkgdir"/usr/lib/xabber_ws -xzf _rel/xabber_ws/xabber_ws-$pkgver.tar.gz

	install -dm0755 -o nobody -g nobody "$pkgdir"/var/log/xabber_ws
	ln -s /var/log/xabber_ws "$pkgdir"/usr/lib/xabber_ws/log

	echo -e "#!/bin/sh\n/usr/lib/xabber_ws/bin/xabber_ws \$@" >"$pkgdir"/usr/bin/xabber_ws
	chmod a+x "$pkgdir"/usr/bin/xabber_ws

	install -Dm0644 "$srcdir"/xabber_ws.service "$pkgdir"/usr/lib/systemd/system/xabber_ws.service
}
