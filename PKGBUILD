pkgname=go-ukify
pkgver=0.2.2
pkgrel=5
pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image written in Go'
arch=('x86_64')
license=('MPL-2.0')
url='https://github.com/kairos-io/go-ukify'
source=("git+$url.git#tag=v0.2.2")
makedepends=(git go)
sha1sums=('cc97d2526e4e569c02d6dc2bfe2515633b6fd493')

pkgver() {
	cd go-ukify
	git describe --tags --long | sed 's/^v//; s/-0-[[:alnum:]]*$//; s/-/+/g'
}

build() {
	cd go-ukify

	local gopkg="${url#https://}"
	local BUILDINFO=(
		"-X $gopkg/internal/common.VERSION=$pkgver"
		"-X $gopkg/internal/common.gitCommit=$(git rev-parse --short HEAD)"
	)

	BUILDFLAGS=(
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
