# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=trezord-go
pkgver=2.0.33
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
       'sysusers.d.conf'
       'libusb.patch::https://github.com/trezor/trezord-go/commit/318b01237604256b1a561b2fa57826aa0ebb218d.patch?full_index=1'
       'libusb_again.patch::https://github.com/trezor/trezord-go/commit/8ca9600d176bebf6cd2ad93ee9525a04059ee735.patch')
sha256sums=('c80e0ba0e727ae2f7bd7a8b0f7082681296d478d1034c64a8bba64ce29239ffa'
            'a9a6c343814b94e9ad3665c971cc33825794e8a8e46e1076819b63c548c89abf'
            'b48d0026281814f9a6a8cac48b701db741391d285867593b4ce272e70aff229a'
            'da346d656db4e8ca01706d8189e52793110f50a1be6d43312f53ccbed1d780e3')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
        #Fix libusb for Go 1.21
        patch -p1 < "$srcdir"/libusb.patch
        #Fix libusb for Go 1.24
        patch -p1 < "$srcdir"/libusb_again.patch
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
