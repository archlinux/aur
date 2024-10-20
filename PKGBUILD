pkgname=go-ukify
_fragment=tag=v0.2.5
pkgver=0.2.5
pkgrel=1
pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image written in Go'
arch=('x86_64')
license=('MPL-2.0')
url='https://github.com/kairos-io/go-ukify'
source=("git+$url.git#$_fragment")
makedepends=(git go)
sha1sums=('SKIP')

pkgver() {
	cd go-ukify
	git describe --tags --long | sed 's/^v//; s/-0-[[:alnum:]]*$//; s/-/+/g'
}

build() {
	cd go-ukify

	export GOPATH="$srcdir"

	local gopkg="${url#https://}"
	local BUILDINFO=(
		"-X $gopkg/internal/common.VERSION=$pkgver"
		"-X $gopkg/internal/common.gitCommit=$(git rev-parse --short HEAD)"
	)

	local BUILDFLAGS=(
		-buildmode=pie
		-trimpath
		-mod=readonly
		-modcacherw
		-ldflags="-linkmode=external ${BUILDINFO[*]}"
	)

	go build "${BUILDFLAGS[@]}" -o ../build/
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin" build/go-ukify
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" go-ukify/LICENSE
}
