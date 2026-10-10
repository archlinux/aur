pkgname=bollworm
pkgver=0.1.0
pkgrel=1
pkgdesc="Turn an OpenAPI document into a Word reference manual"
arch=('x86_64' 'aarch64')
url="https://github.com/Smiduweorc/bollworm"
license=('MIT')
depends=('glibc')
makedepends=('go')
# -trimpath rewrites source paths, so a debug package would have no sources
# and a dangling build-id link. Skip it rather than ship a broken one.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Refresh on every pkgver bump with `updpkgsums` (pacman-contrib), once the
# tag's tarball is published upstream.
sha256sums=('f2a744e62235b1ce10021fe1e6d7d6fbf2fde95137b4f9fbb411a2130bd2a8e7')

prepare() {
	cd "$pkgname-$pkgver"
	# Fill the module cache here so build() needs no network.
	go mod download
}

build() {
	cd "$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	# The version is the bare pkgver, matching GoReleaser's {{ .Version }}.
	# No -s -w: stripping is makepkg's job.
	go build -ldflags "-linkmode=external -X main.version=$pkgver" \
		-o build/bollworm ./cmd/bollworm

	local sh
	for sh in bash zsh fish; do
		build/bollworm completion "$sh" >"build/completion.$sh"
	done
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 build/bollworm "$pkgdir/usr/bin/bollworm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 build/completion.bash \
		"$pkgdir/usr/share/bash-completion/completions/bollworm"
	install -Dm644 build/completion.zsh \
		"$pkgdir/usr/share/zsh/site-functions/_bollworm"
	install -Dm644 build/completion.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/bollworm.fish"
}
