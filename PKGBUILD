# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=eqk-git
pkgver=1.0.0.r0.a3dec55
pkgrel=1
pkgdesc='Earthquake Data Fetcher in Go'
arch=('x86_64')
url='https://github.com/mpinheir/eqk'
license=('MIT')
depends=(
  glibc
)
makedepends=(
  git
  go
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/mpinheir/eqk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	mkdir -p build/
}

build() {
	cd "$srcdir/${pkgname%-git}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o build .
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 "build/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
