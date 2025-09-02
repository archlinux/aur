# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
pkgname=clash-exporter-git
pkgver=v0.0.4.r3.ge89e2c8
pkgrel=1
pkgdesc="Prometheus exporter for Clash proxy"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/zxh326/clash-exporter"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('clash-exporter')
conflicts=('clash-exporter')
source=('git+https://github.com/zxh326/clash-exporter.git'
        'clash-exporter.service')
sha256sums=('SKIP'
            '8968996facc6d863ee38683a87b53d446b78bfdfca211e2731cbdff1aea73d53')

pkgver() {
	cd "$srcdir/clash-exporter"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/clash-exporter"
	
	export CGO_ENABLED=0
	export GOOS=linux
	export GOARCH=$(go env GOARCH)
	
	case "$CARCH" in
		armv6h) export GOARCH=arm && export GOARM=6 ;;
		armv7h) export GOARCH=arm && export GOARM=7 ;;
		aarch64) export GOARCH=arm64 ;;
	esac
	
	go build -trimpath -ldflags "-extldflags=-static" -o clash-exporter .
}

package() {
	cd "$srcdir/clash-exporter"
	install -Dm755 clash-exporter "$pkgdir/usr/bin/clash-exporter"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/clash-exporter/LICENSE"
	install -Dm644 "$srcdir/clash-exporter.service" "$pkgdir/usr/lib/systemd/system/clash-exporter.service"
}
