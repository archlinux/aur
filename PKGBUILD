# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=helmsman-git
pkgrel=1
pkgver=3.8.1.r2.g2371260
pkgdesc="Helmsman upstream"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('helmsman::https://github.com/Praqma/helmsman')
md5sums=('SKIP')
_gourl=github.com/Praqma/helmsman

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build ./cmd/...
}

check() {
	cd "$srcdir/${pkgname%-git}"
	go test ./...
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/helmsman/helmsman" "$pkgdir/usr/bin"
}
