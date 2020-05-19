# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=robustirc-bridge
_srcname=bridge
pkgver=1.8
pkgrel=2
pkgdesc='Bridge to robustirc.net-IRC-Network'
arch=(i686 x86_64)
url='https://github.com/robustirc/bridge'
license=('BSD-3-clause')
makedepends=('go')
conflicts=('robustirc-bridge-git')
source=('https://github.com/robustirc/bridge/archive/v1.8.tar.gz')
sha256sums=('55a7f217e981eb4f8e157475c84c4d16b1dda57022178250b57db7b889cf904c')

prepare() {
	cd "$_srcname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$_srcname-$pkgver"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build ./...
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/$_srcname-$pkgver/build/robustirc-bridge" "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -p -m755 "$srcdir/$_srcname-$pkgver/robustirc-bridge.service" "$pkgdir/usr/lib/systemd/system"
	install -p -m755 "$srcdir/$_srcname-$pkgver/robustirc-bridge@.service" "$pkgdir/usr/lib/systemd/system"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$_srcname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/share/man/man1"
	install -Dm644 "$srcdir/$_srcname-$pkgver/robustirc-bridge.1" "$pkgdir/usr/share/man/man1"
}
