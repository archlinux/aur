# Maintainer: Atila de Freitas <atiladefreitas@users.noreply.github.com>
pkgname=verso-reader
_repo=verso # GitHub repository name (tarball extracts to $_repo-$pkgver)
_bin=verso  # installed command name
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal, text-first EPUB reader for the terminal (Bubble Tea)"
arch=('x86_64')
url="https://github.com/atiladefreitas/$_repo"
license=('MIT')
makedepends=('go')
conflicts=('verso') # the unrelated AUR 'verso' package also ships /usr/bin/verso
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8fbea38bf8447edddbc494a2ea189b8ce160549a4fd3090a68e26c9e6dc2d6c2')

prepare() {
	cd "$_repo-$pkgver"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go mod download
}

build() {
	cd "$_repo-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$_bin" .
}

check() {
	cd "$_repo-$pkgver"
	go test ./...
}

package() {
	cd "$_repo-$pkgver"
	install -Dm755 "$_bin" "$pkgdir/usr/bin/$_bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
