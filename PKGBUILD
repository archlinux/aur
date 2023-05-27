# Maintainer: éclairevoyant

pkgname=owncast
pkgver=0.0.13
pkgrel=1
pkgdesc='Self-hosted live video streaming (chat included)'
url="https://github.com/owncast/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b88f67d26fa438320debe01de2651df1625314ec5a89dde4b9d64c40296481f35fdda2e93bb268e93a0be8a5645a5a4243da1f9894c78b64054b302392779319')
options=(emptydirs)
install=$pkgname.install

build() {
	cd $pkgname-$pkgver
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X main.version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd $pkgname-$pkgver
	install -vDm755 $pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -vdm755 "$pkgdir/var/www/$pkgname/"
	install -vDm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/$pkgname.service" <<eof
[Unit]
Description=Owncast Service

[Service]
Type=simple
WorkingDirectory=/var/www/$pkgname/
ExecStart=/usr/bin/$pkgname
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
eof
}
