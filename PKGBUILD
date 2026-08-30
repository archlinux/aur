pkgname=bagworm
# GitHub archives extract to the repository's canonical casing, which is
# "Bagworm" - keep this in sync if the repo is ever renamed to lowercase.
_repo=Bagworm
pkgver=0.1.0
pkgrel=1
pkgdesc="Opinionated developer UX for OCI containers - drops you into a shell inside your project's image"
arch=('x86_64' 'aarch64')
url="https://github.com/Smiduweorc/Bagworm"
license=('MIT')
depends=('glibc')
makedepends=('go')
# -trimpath rewrites source paths, so the debug package ends up with no
# sources and a dangling build-id symlink. Go debug packages aren't useful
# here; skip them rather than ship a broken one.
options=('!debug')
optdepends=('podman: container runtime'
            'docker: container runtime'
            'nerdctl: container runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cb9917a2bb5e01d7c40c69dddb1a227c814a5d4d97ab7f9f34b7e9d08d122373')

prepare() {
	cd "$_repo-$pkgver"
	# Populate the module cache here so build() needs no network.
	go mod download
}

build() {
	cd "$_repo-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	# No -s -w: leave symbol handling to makepkg's own strip option rather
	# than hardcoding it here.
	go build -ldflags "-linkmode=external -X main.version=v$pkgver" \
		-o build/bagworm ./cmd/bagworm

	local sh
	for sh in bash zsh fish; do
		build/bagworm completion "$sh" >"build/completion.$sh"
	done
}

check() {
	cd "$_repo-$pkgver"
	# Integration tests sit behind the "integration" build tag and need a
	# real runtime, so a plain run stays hermetic.
	go test ./...
}

package() {
	cd "$_repo-$pkgver"

	install -Dm755 build/bagworm "$pkgdir/usr/bin/bagworm"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 bagworm.example.yaml \
		"$pkgdir/usr/share/doc/$pkgname/bagworm.example.yaml"

	install -Dm644 build/completion.bash \
		"$pkgdir/usr/share/bash-completion/completions/bagworm"
	install -Dm644 build/completion.zsh \
		"$pkgdir/usr/share/zsh/site-functions/_bagworm"
	install -Dm644 build/completion.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/bagworm.fish"
}