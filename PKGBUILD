# Maintainer: Takase <takase1121 at proton dot me>

pkgname=superderper
pkgver=0.1.1
pkgrel=1

pkgdesc='superderper allows derper to admit clients from multiple tailnets.'
url='https://github.com/takase1121/superderper'
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc')
makedepends=('go' 'git')

backup=('etc/default/tailscaled-derper'
	'etc/default/superderper')
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/takase1121/superderper/archive/v$pkgver.tar.gz")
sha256sums=('1b71e59414c2be31ff515ff1ccaebbf9fc491320195d14ca3596c23a5f087fe3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -buildmode=pie -ldflags "-linkmode=external -extldflags=$LDFLAGS"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 superderper.service "$pkgdir/usr/lib/systemd/system/superderper.service"
	install -Dm644 tailscaled-derper@.service "$pkgdir/usr/lib/systemd/system/tailscaled-derper@.service"
	install -Dm644 superderper.conf "$pkgdir/etc/default/superderper"
	install -Dm644 tailscaled-derper.conf "$pkgdir/etc/default/tailscaled-derper"

	install -Dm755 -t "$pkgdir/usr/bin" superderper
}
