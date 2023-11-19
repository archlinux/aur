# Maintainer: éclairevoyant

pkgname=owncast
pkgver=0.1.2
pkgrel=1
pkgdesc='Self-hosted live video streaming (chat included)'
url="https://github.com/owncast/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d173461004599788698bfd241e0522cfcda462ac6977abfff1a2a4b42ad908457dbf60e27f0fa1135e6afde2c9f4ef40ac6b4bf61ea086c52b94347b4a913472')
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
	install -vDm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/$pkgname.service" <<eof
[Unit]
Description=Owncast Service

[Service]
Type=simple
User=owncast
Group=owncast
WorkingDirectory=/var/lib/$pkgname/
ExecStart=/usr/bin/$pkgname
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
eof

install -vDm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<eof
# Type  Name    ID GECOS HomeDir          Shell
u       $pkgname -  -     /var/lib/$pkgname -
eof

	install -vDm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf" <<eof
# Type Path                               Mode User    Group   Age Argument
d      /var/lib/$pkgname            0700 $pkgname $pkgname -   -
eof

}
