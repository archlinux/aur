# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=iferr-git
pkgver=r12.9c3e2fb
pkgrel=1
epoch=1
pkgdesc="Tool for generating if err != nil { blocks."
arch=('x86_64')
url="https://github.com/koron/iferr"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('git' 'go')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd iferr
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd iferr
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o bin/ .
}

package() {
	cd iferr
	install -Dm755 "bin/iferr" -t "${pkgdir}/usr/bin/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
