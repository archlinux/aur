# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=slopquota
pkgver=0.1.0
pkgrel=3
pkgdesc="CLI utility for viewing token quotas from AI subscriptions like OpenAI Codex, Claude Max, Grok, OpenCode etc"
arch=('x86_64')
url="https://gitlab.com/nathanchere/slopquota"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+https://gitlab.com/nathanchere/slopquota.git#tag=v${pkgver}")
sha256sums=('c1a2ae6b993ffa825798da6a18c165bc6602eef281e63d3030356fc084879359')

prepare() {
	cd "$srcdir/$pkgname/src"
	go mod download
}

build() {
	cd "$srcdir/$pkgname/src"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	mkdir -p "$srcdir/bin"
	go build -ldflags="-linkmode=external" -o "$srcdir/bin/$pkgname" ./slopquota
}

check() {
	cd "$srcdir/$pkgname/src"
	go test ./...
}

package() {
	install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
