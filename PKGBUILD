# Contributor: Sergej Pupykin <sergej.pupykin@dsr-company.com>
pkgname=xabber-websocket
pkgver=0.3.1
pkgrel=1
pkgdesc="WebSocket XMPP client interface"
arch=(i686 x86_64)
url="https://github.com/redsolution/${pkgname}"
license=(GPL)
depends=()
makedepends=(erlang git)
source=("git+${url}.git#tag=${pkgver}"
  "xabber_ws.service")
sha512sums=('SKIP'
  '7eee228b133d31ee59f46a7853733aa5c739a74f837caff7d3046fa1c690a191bde77848bb20fb82b8144b6256ae8bbd09aa2c039b9b70384ffeec3376e5aae1')

build() {
  cd $pkgname
  make -j1 fetch-deps
  make -j1
}

package() {
  cd $pkgname
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
