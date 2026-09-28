pkgname=go-jsonnet
pkgver=0.22.0
pkgrel=3
pkgdesc="An implementation of Jsonnet in pure Go"
arch=('x86_64')
url="https://github.com/google/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=("jsonnet=${pkgver}")
conflicts=('jsonnet' 'go-jsonnet-git')
source=("https://github.com/google/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('aa5950b15fcd6b5add8a6aafb0aaaaee495071742f3abc6825e78aa8f5faa4dc')

prepare() {
	cd "${pkgname}-v${pkgver}"
	go mod download
}

build() {
	cd "${pkgname}-v${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build/ ./cmd/...
}

package() {
	cd "${pkgname}-v${pkgver}"

	install -m755 -Dt "$pkgdir/usr/bin/" build/jsonnet
	install -m755 -Dt "$pkgdir/usr/bin/" build/jsonnetfmt
	install -m755 -Dt "$pkgdir/usr/bin/" build/jsonnet-deps
	install -m755 -Dt "$pkgdir/usr/bin/" build/jsonnet-lint

	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname/"     README.md
}
