pkgname=go-ukify

_fragment=tag=v0.3.1

pkgver=0.3.1
pkgrel=1
pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image written in Go'
arch=('x86_64')
license=('MPL-2.0')
url='https://github.com/kairos-io/go-ukify'
source=("git+$url.git#$_fragment")
makedepends=(git go)
sha1sums=('215c07d9539ea6c64ef67ab7332f71aab711c4be')

pkgver() {
	git -C "$pkgname" describe --tags --first-parent | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	go mod tidy
	go mod vendor
}

build() {
	cd "$pkgname"

	local gopkg="${url#https://}"
	local BUILDFLAGS=(
		-buildmode=pie
		-trimpath
		-ldflags="
			-s -w -linkmode=external
			-X $gopkg/internal/common.VERSION=$pkgver
			-X $gopkg/internal/common.gitCommit=$(git rev-parse --short HEAD)
		"

	)

	go build "${BUILDFLAGS[@]}" -o ../build/
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin" build/go-ukify
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" go-ukify/LICENSE
}
