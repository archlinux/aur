# Maintainer: éclairevoyant

pkgname=owncast
pkgver=0.1.1
pkgrel=1
pkgdesc='Self-hosted live video streaming (chat included)'
url="https://github.com/owncast/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('1ae59cfe04fc65d67342f42459b12ed93b36e155f56956623af163d3c5cb7586e8a7e2bc99a8e2847312db091a27dbde66f36c3bd5f87faaa6955dd89ff98230')
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
