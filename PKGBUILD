# Maintainer: zhs <zhao4she4@tuta.io>

pkgname=crawl-git
_pkgname=crawl
pkgver=r83.ef2c410
pkgrel=1
pkgdesc="Simple web crawler written in Go, storing websites in WARC format"
arch=('x86_64')
url="https://git.autistici.org/ale/crawl/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
install=crawl-git.install
source=("git+https://git.autistici.org/ale/crawl/")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	mkdir -p build/
}

build() {
	cd "${srcdir}/${_pkgname}"

        export CGO_CPPFLAGS="$CPPFLAGS"
        export CGO_CFLAGS="$CFLAGS"
        export CGO_CXXFLAGS="$CXXFLAGS"
        export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "${srcdir}/${_pkgname}"
	go test ./...
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 -- "build/crawl" "${pkgdir}/usr/bin/go-crawl"
	install -Dm755 -- "build/links" "${pkgdir}/usr/bin/go-links"
	install -Dm755 -- "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
