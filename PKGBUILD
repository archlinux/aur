# Maintainer: Mike Wilson <aur at mjwilson dot org>

pkgname=qui
pkgver=1.13.1
pkgrel=1
pkgdesc="A fast, modern web interface for qBittorrent"
arch=('x86_64')
url="https://github.com/autobrr/qui"
license=('GPL-2.0-or-later')
makedepends=('git' 'go>=1.25' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.service"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles")
sha256sums=('e21834262b6d08c72fa057efd5ecfcea3b51b4fc16da6210d11b6f8e1eb8f821'
            'd52299510cf4845f0514eefd492b01c33bc2cd2819c2be9dc157f50f67462bd2'
            '149029ffcc078976e0ac6cd1f002b25221bb1561a1c979362dc27d9e6ad5dda3'
            '3bacde8867fbb7b6d566666b635589579c1cc079cd23418284f43a7b37f0c41b')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/

	# Retrieve Go dependencies
	export GOPATH="$srcdir"
	# Don't proxy connection through Google
	export GOPROXY=direct
	go mod download -modcacherw

	# Retrieve NodeJS dependencies
	cd web
	pnpm install
}

build() {
	cd "$pkgname-$pkgver"

	# Build frontend
	pnpm --dir web run build

	# Set Go flags
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	# Build backend
	go build -o build ./cmd/...

	# Generate shell completions
	"build/$pkgname" completion bash > bash_completion
	"build/$pkgname" completion zsh > zsh_completion
	"build/$pkgname" completion fish > fish_completion
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	# systemd files
	install -Dm755 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service" 
	install -Dm755 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm755 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	cd "$pkgname-$pkgver"

	# Binary
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Shell Completions
	install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 zsh_completion "$pkgdir/usr/share/zsh/site-functions/$pkgname"
	install -Dm644 fish_completion "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
