pkgname=cephalote
# GitHub archives extract to the repository's canonical casing, which is
# "Cephalote" - keep this in sync if the repo is ever renamed to lowercase.
_repo=Cephalote
pkgver=0.0.1
pkgrel=1
pkgdesc="Scan source code for weak cryptographic schemes"
arch=('x86_64' 'aarch64')
url="https://github.com/Smiduweorc/Cephalote"
license=('MIT')
depends=('glibc')
makedepends=('go')
# -trimpath rewrites source paths, so the debug package ends up with no
# sources and a dangling build-id symlink. Go debug packages aren't useful
# here; skip them rather than ship a broken one.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5472d7a2fffd31b821d6f9b5cdd1e3700825ad080e73b6c9d027e6f362f4ce9')

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

	# Upstream ships two profiles: a zero-cgo static default (built to be
	# scp'd onto a server) and a cgo "treesitter" build that adds real
	# Python AST analysis at high confidence. A distro package is compiled
	# on the user's machine against a toolchain that is already there, so
	# the static profile buys nothing - take the tier that detects more.
	#
	# main.version is what lands in SARIF output as the tool version, so it
	# uses the bare pkgver to match the official GoReleaser binaries, whose
	# {{ .Version }} is the tag with the "v" stripped.
	#
	# No -s -w: leave symbol handling to makepkg's own strip option rather
	# than hardcoding it here.
	go build -tags treesitter \
		-ldflags "-linkmode=external -X main.version=$pkgver" \
		-o build/cephalote ./cmd/cephalote

	local sh
	for sh in bash zsh fish; do
		build/cephalote completion "$sh" >"build/completion.$sh"
	done
}

check() {
	cd "$_repo-$pkgver"
	# Same tag as build(), so the tier that ships is the tier that is tested.
	go test -tags treesitter ./...
}

package() {
	cd "$_repo-$pkgver"

	install -Dm755 build/cephalote "$pkgdir/usr/bin/cephalote"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 docs/SCHEDULING.md \
		"$pkgdir/usr/share/doc/$pkgname/SCHEDULING.md"
	install -Dm644 cephalote.example.yaml \
		"$pkgdir/usr/share/doc/$pkgname/cephalote.example.yaml"

	install -Dm644 build/completion.bash \
		"$pkgdir/usr/share/bash-completion/completions/cephalote"
	install -Dm644 build/completion.zsh \
		"$pkgdir/usr/share/zsh/site-functions/_cephalote"
	install -Dm644 build/completion.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/cephalote.fish"
}
