# Maintainer: ZAvrikDinozavrik <zaz965@stm32f0.ru>
pkgname=envmerge-git
pkgver=r3.910a786
pkgrel=1
pkgdesc="Merge new keys from .env.example into your .env (TUI + silent mode)"
arch=('x86_64' 'aarch64')
url="https://git.alexavr.ru/ZAvrikDinozavrik/envmerge"
license=('MIT')
makedepends=('git' 'go')
provides=('envmerge')
conflicts=('envmerge')
source=("$pkgname::git+https://git.alexavr.ru/ZAvrikDinozavrik/envmerge.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	export CGO_ENABLED=0
	export GOFLAGS='-mod=vendor -trimpath'
	export GOPATH="$srcdir/gopath"
	export GOCACHE="$srcdir/gocache"
	go build -ldflags "-s -w -X main.version=$pkgver" -o envmerge .
}

check() {
	cd "$pkgname"
	export GOFLAGS='-mod=vendor'
	export GOPATH="$srcdir/gopath"
	export GOCACHE="$srcdir/gocache"
	go test ./...
}

package() {
	install -Dm755 "$pkgname/envmerge" "$pkgdir/usr/bin/envmerge"
	install -Dm644 "$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
