# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Reference: https://wiki.archlinux.org/index.php?title=Go_package_guidelines#Sample_PKGBUILD

_pkgname=vimdecrypt
pkgname=vimdecrypt-go-git
pkgrel=1
pkgver=r18.ccd1079
pkgdesc='Golang tool for decrypting VIM encrypted files'
arch=('x86_64')
url="https://github.com/doggeddog/vimdecrypt"
license=('MIT')
makedepends=('git' 'go')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	mkdir -p build/
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm755 build/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 README.md "$pkgdir"/usr/share/doc/vimdecrypt-go/README.md
}
