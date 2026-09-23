pkgname=go-ukify

: "${_fragment:=tag=v0.5.2}"

pkgver=0.5.2
pkgrel=1
pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image written in Go'
arch=('x86_64')
license=('MPL-2.0')
url='https://github.com/kairos-io/go-ukify'
source=("git+$url.git#$_fragment")
makedepends=(git go)
sha1sums=('2b69fc661c1aa4f7ef7879692f58d40337b23fb3')

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
	local goflags=(
		-v
		-buildmode=pie
		-trimpath
		-mod=vendor
		-ldflags="
			-linkmode external
			-extldflags \"${LDFLAGS}\"
			-X $gopkg/internal/common.VERSION=\"$pkgver\"
			-X $gopkg/internal/common.gitCommit=\"$(git rev-parse --short HEAD)\"
		"
	)

	go build "${goflags[@]}" -o ../build/
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin" build/go-ukify
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" go-ukify/LICENSE
}
