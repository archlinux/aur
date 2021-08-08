# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=darktile-git
pkgver=0.0.10.r0.g41f8406
pkgrel=1
pkgdesc="A GPU-rendered terminal emulator designed for tiling window managers"
arch=('x86_64')
url="https://github.com/liamg/darktile"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxinerama' 'xorg-xinput')
makedepends=('go' 'git')
provides=('darktile')
conflicts=('darktile')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build -ldflags="-linkmode=external -X github.com/liamg/darktile/internal/app/darktile/version.Version=$pkgver" ./cmd/darktile
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -Dm 755 build/darktile -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
