# Maintainer: Leo <i@setuid0.dev>
pkgname=tlsrouter-git
pkgver=r68.2862066
pkgrel=1
pkgdesc="Proxy TCP connections based on static rules, HTTP Host headers, and SNI server names"
arch=(x86_64)
url="https://pkg.go.dev/inet.af/tcpproxy"
license=('Apache-2.0')
groups=()
depends=()
makedepends=('git' 'go>=1.16')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=(
	'tcpproxy::git+https://github.com/inetaf/tcpproxy.git'
	'tlsrouter.sample.conf'
)
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/tcpproxy"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	export GOPATH="$srcdir/gopath"
	cd "$srcdir/tcpproxy"
	go mod download
	go mod verify
}

build() {
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$srcdir/tcpproxy"

	CGO_ENABLED=0 go build \
		-trimpath \
		-o ./tlsrouter \
		./cmd/tlsrouter/main.go \
		./cmd/tlsrouter/config.go \
		./cmd/tlsrouter/sni.go
}

check() {
	:
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/tcpproxy/tlsrouter"
	install -Dt "$pkgdir/usr/share/tlsrouter/" -m644 "$srcdir/tlsrouter.sample.conf"
	install -Dt "$pkgdir/usr/lib/systemd/system/" -m644 "$srcdir/tcpproxy/systemd/tlsrouter.service"
}
