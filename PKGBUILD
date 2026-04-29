pkgname=nanokvm-usb
pkgver=1.1.4
pkgrel=1
pkgdesc="allows you to perform maintenance tasks without the need for a keyboard, mouse, or monitor"
arch=('x86_64')
url="https://github.com/sipeed/NanoKVM-USB/"
license=('GPL-3.0-only')
depends=('nodejs-http-server')
makedepends=('git' 'npm' 'typescript' 'yarn')
optdepends=('chromium: or other browser that supports web-camera and serial port')
source=("git+https://github.com/sipeed/NanoKVM-USB.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/NanoKVM-USB/browser"
	yarn install
	yarn build
}

package() {
	cd "$srcdir/NanoKVM-USB/browser"
	install -dm0755 "$pkgdir"/usr/{bin,share}/
	cp -a ./dist "$pkgdir/usr/share/$pkgname"
	cat >"$pkgdir/usr/bin/nanokvm-usb-browser" <<EOF
#!/bin/bash

cd /usr/share/$pkgname
exec http-server -p 8080 -a localhost
EOF
	chmod 0755 "$pkgdir/usr/bin/nanokvm-usb-browser"
}
