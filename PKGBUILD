# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=trezord-go
pkgver=2.0.32
pkgrel=1
pkgdesc="TREZOR Communication Daemon aka TREZOR Bridge (written in Go)"
arch=('x86_64' 'i686')
url="https://github.com/trezor/trezord-go"
license=('LGPL3')
depends=('glibc' 'trezor-udev')
makedepends=('go')
provides=('trezord')
conflicts=('trezord')
options=('!emptydirs')
install=trezord-go.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
       'sysusers.d.conf')
sha256sums=('4738eba87fcae0e81ab89696eca45915a8f00aaf778f784b715523baad89e4a3'
            'a9a6c343814b94e9ad3665c971cc33825794e8a8e46e1076819b63c548c89abf')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o trezord
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D trezord -t "$pkgdir/usr/bin/"
	install -Dm644 release/linux/trezord.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "$srcdir/sysusers.d.conf" "$pkgdir/usr/lib/sysusers.d/trezord.conf"
}
