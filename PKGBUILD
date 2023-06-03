# Maintainer: éclairevoyant

pkgname=owncast
pkgver=0.1.0
pkgrel=2
pkgdesc='Self-hosted live video streaming (chat included)'
url="https://github.com/owncast/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('13608a7f4b93fffa83d1709be1f4b6a4a96ea2024dbde91f56c61b9578544130a085e6b13a3ea6476beb6d76c6bb42bd9532a9e47c85350e468fc3ef76da0e11')
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
