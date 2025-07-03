# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certspotter'
pkgver='0.21.0'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL-2.0')
makedepends=('go>=1.24.4' 'lowdown')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.service::https://salsa.debian.org/go-team/packages/$pkgname/-/raw/debian/0.18.0-1/debian/service"
	"$pkgname-$pkgver.sysusers::https://salsa.debian.org/go-team/packages/$pkgname/-/raw/debian/0.18.0-1/debian/sysusers"
	"$pkgname.tmpfiles"
)
b2sums=('de3d374271fcfe528adca7261e1eb0efa71e7d1398f3eb71b1ddb9fc522430fa7954854ee1d90d28c7a2b25368ea7321a0050da8dcfb61d5c26ff4f7411de211'
        '5f2ac07e92376e73ae84a9811a9977716bb2750ecd8b0298e2b2f838e2633e8fce1c0f89ddedd3d17c65582527fe369ea50a93f5379b482cb45069f47d075a89'
        'b323decea9386a49c57227f9c5b11435e0d742a30037296b9b352b00e4b18cdd1a3da1a087d56783c484f2bd30152372b828790754d226ba534ff884861f0618'
        'b04bdf259018bc04f4f9b8b5482af4ff19edc55eb5c6fd30f694b29b8b83b83db9bb0a3561669ac5c7f3a4c63b9454d5a4e3ffe10e5fd5026b7adcd6af46fe09')

_sourcedirectory="$pkgname-$pkgver"
_bindir="$pkgname-$pkgver-bin"
_gopath="$pkgname-$pkgver-gopath"

prepare() {
	mkdir -p "$srcdir/$_bindir/"
	mkdir -p "$srcdir/$_gopath/"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildvcs=false -buildmode=pie -trimpath '-ldflags=-X=main.Version=$pkgver -X=main.Source=software.sslmate.com/src/$pkgname -linkmode=external' -mod=readonly -modcacherw"
	go build -v -o "$srcdir/$_bindir/" './...'

	# Build man pages
	cd "$srcdir/$_sourcedirectory/man/"
	make all
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests
	go test -v './...'

	# Verify that the basic functionality works
	_checkoutput="$("$srcdir/$_bindir/$pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgname version $pkgver"
}

package() {
	cd "$srcdir/"

	# Binaries
	install -dm755 "$pkgdir/usr/bin/"
	install -Dm755 "$_bindir/"* "$pkgdir/usr/bin/"

	# Man pages
	install -dm755 "$pkgdir/usr/share/man/man8/"
	install -Dm644 "$_sourcedirectory/man/"*'.8' "$pkgdir/usr/share/man/man8/"

	# Service, sysusers, tmpfiles
	install -Dm644 "$pkgname-$pkgver.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname-$pkgver.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
