# Maintainer: Ícar N. S. <aur@icarns.xyz>

pkgname=diec-offline-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Consulta el DIEC2 sense connexió, amb cerca de text complet al terminal"
arch=('any')
url="https://gitlab.com/juxuanu/diec-offline"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
install="$pkgname.install"
provides=('diec-offline')
conflicts=('diec-offline')
options=('!debug' '!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	go mod download
	# test
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o build/diec ./cmd/diec
}

check() {
	cd "$srcdir/$pkgname"
	go test ./...
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 build/diec "$pkgdir/usr/bin/diec"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

