# Maintainer: Nogweii <packages@nogweii.net>
pkgname=wait4tailscale
# renovate: datasource=github-releases depName=josh/wait4tailscale
pkgver=1.1.4
pkgrel=1
pkgdesc='Monitor Tailscale connection status with systemd integration'
arch=('x86_64')
url='https://github.com/josh/wait4tailscale'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8956959ffdb4fa2a543ca2cd0e8c2e058bd237fe7435efdf40b6838c9cff7d04860b0c0c2e402731ede0fa2463cb5d7e058d9254c24399566551188dd8e0e958')
b2sums=('f981f6e89b9bb7d5c603d1bf9aaf6ff8e141b824176c0dbdb7fa112b89bb656765a590f5eb5c0933cb31f6f29bd3daac883b4565338673ae6e6d042ddab6af7a')

prepare() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="$srcdir"
	go mod download -modcacherw
}

build() {
	cd "${srcdir}/$pkgname-$pkgver" || exit

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOPATH="$srcdir"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

	go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
	cd "${srcdir}/$pkgname-$pkgver" || exit
	install --verbose -Dm755 "$pkgname" -t "$pkgdir/usr/bin"

	install --verbose -d "$pkgdir/usr/lib/systemd/system/"
	install --verbose --mode=644 systemd/tailscale-online.target "$pkgdir/usr/lib/systemd/system/"
	install --verbose --mode=644 systemd/tailscale-wait-online.service "$pkgdir/usr/lib/systemd/system/"
	install --verbose -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
