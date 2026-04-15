# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: whiteman808 <whiteman808 at paraboletancza dot org>
# Contributor: Jeff Henson <jeff at henson dot io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: darkhz <kmachanwenw at gmail dot com>
pkgname='bluetuith'
pkgver='0.2.6'
pkgrel='2'
epoch='1'
pkgdesc='TUI-based bluetooth manager'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname-org/$pkgname"
license=('MIT')
depends=('bluez' 'dbus')
makedepends=('go>=1.25' 'git')
optdepends=(
	'bluez-obex: send and receive files via OBEX'
	'networkmanager: PANU network tethering'
	'modemmanager: DUN network tethering'
	'pulse-native-provider: device audio profile management'
)
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver")
b2sums=('639a2ee6b28cd9a08806644d5c97e54614757f912a5df3265dc5f36b3709b039b2e3ab26d31f023cf761de1c2a6321336978a4343a68435f3cfd1fc00e3ac21a')

_sourcedirectory="$pkgname-$pkgver"
_bindir="$pkgname-$pkgver-bin"
_gopath="$pkgname-$pkgver-gopath"

prepare() {
	mkdir -p "$srcdir/$_bindir/"
	mkdir -p "$srcdir/$_gopath/"

	cd "$srcdir/$_sourcedirectory/"

	# Download dependencies
	export GOPATH="$srcdir/$_gopath"
	go mod download -modcacherw
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath '-ldflags=-X=github.com/darkhz/bluetuith/cmd.Version=$pkgver@$(git rev-parse --short HEAD) -linkmode=external' -mod=readonly -modcacherw"
	go build -v -o "$srcdir/$_bindir/" './...'
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Verify that the basic functionality works
	_checkoutput="$("$srcdir/$_bindir/$pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgver@$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/"

	# Binaries
	install -dm755 "$pkgdir/usr/bin/"
	install -Dm755 "$_bindir/"* "$pkgdir/usr/bin/"

	# Docs
	install -dm755 "$pkgdir/usr/share/doc/"
	install -Dm644 "$_sourcedirectory/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

	# License
	install -dm755 "$pkgdir/usr/share/licenses/"
	install -Dm644 "$_sourcedirectory/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
