# Maintainer: Nogweii <me@nogweii.net>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>
pkgname='kubecolor'
# renovate: datasource=github-releases depName=kubecolor/kubecolor
pkgver=0.6.0
pkgrel=1
pkgdesc='Colorize your kubectl output'
url='https://github.com/kubecolor/kubecolor'
arch=('x86_64')
license=('MIT')
depends=('kubectl')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('99b2126c4d33664220ee8270def853d668ebdb1418b1eeaf93b1ab7d8799561c')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export CGO_ENABLED=1
	export GOPATH="$srcdir"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -trimpath"

	go build -ldflags "-compressdwarf=false -linkmode external" .
}

check() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export CGO_ENABLED=1
	export GOPATH="$srcdir"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -trimpath"

	go test -ldflags "-compressdwarf=false -linkmode external" -v ./...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
	install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
