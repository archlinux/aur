# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=golint-git
pkgver=20210508.6edffad
pkgrel=1
pkgdesc="A linter for Go source code."
arch=('x86_64')
url="https://golang.org/x/lint"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('go')
source=('git://github.com/golang/lint.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/lint"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd lint

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o bin/ "./${pkgname%-git}"
}

package() {
	cd lint
	install -Dm755 -- "bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 -- "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
