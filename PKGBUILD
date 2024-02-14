# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=maildir-rank-addr-git
pkgver=1.3.0.r3.g34242a3
pkgrel=1
pkgdesc='Generates a ranked addressbook from a maildir folder'
arch=('x86_64')
url="https://github.com/ferdinandyb/maildir-rank-addr"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
makedepends=('go' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build .
}

check() {
	cd "$srcdir/$pkgname"
	go test .
}

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 -t "$pkgdir"/usr/bin "${pkgname%-git}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"${pkgname%-git}" LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/doc/"${pkgname%-git}" README.md
}
