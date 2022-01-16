# Maintainer: Gadzhi Kharkharov <x at kkga dot me>
pkgname=kks
pkgver=0.3.8
pkgrel=1
pkgdesc='Handy Kakoune companion'
arch=('x86_64' 'arm')
url="https://github.com/kkga/kks"
license=('Unlicense')
makedepends=('go')
optdepends=(
	'fzf:     fzf integration'
	'bat:     fzf integration'
	'fd:      fzf integration'
	'ripgrep: fzf integration')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=("$pkgname")
conflicts=("$pkgname")

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X main.version=${pkgver} -linkmode external -extldflags \"${LDFLAGS}\"" \
		-o build .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm755 scripts/kks-* "$pkgdir"/usr/bin/
	install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
