# Maintainer: Limgmk <limgmkgm@gmail.com>

pkgname=leedns-git
pkgver=0.0.2.r0.g5960650
pkgrel=1
pkgdesc="A dns server and client which support udp, tcp, dot and doh"
arch=('any')
url="https://github.com/Limgmk/leedns"
license=('unknown')
groups=()
depends=()
makedepends=('git' 'go')
backup=('etc/leedns/config.yaml')
options=()

source=("$pkgname::git+${url}.git"
	"leedns.service::https://files.limgmk.com/leedns.service")

md5sums=('SKIP' '7ee04c2df32948b8a1855bf7230edaa7')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_ENABLED=0
	export GOOS=linux
	go build -ldflags '-s -w --extldflags "-static -fpic"' -o target/leedns-v$pkgver
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m 0755 target/leedns-v$pkgver -T $pkgdir/usr/bin/leedns
	install -D -m 0644 config_example.yaml -T $pkgdir/etc/leedns/config.yaml
	install -D -m 0644 $srcdir/leedns.service -T $pkgdir/usr/lib/systemd/system/leedns.service
}
