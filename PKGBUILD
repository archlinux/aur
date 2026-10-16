pkgname=cephalote
# GitHub archives extract to the repository's canonical casing, which is
# "Cephalote" - keep this in sync if the repo is ever renamed to lowercase.
_repo=Cephalote
pkgver=0.2.1
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
# Refresh on every pkgver bump with `updpkgsums` (pacman-contrib); it needs the
# tagged tarball to be published upstream first.
sha256sums=('75c01035579f5e6aa3339d14696514207876ee117e1c640ed673b6d8a9cbad0a')

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

	# Tree-sitter is compiled into every cgo build. Upstream's release
	# binaries link it statically against musl; a distro package links
	# dynamically against the system libc like everything else, which is
	# why this is a plain cgo build with no static flags.
	#
	# main.version is what lands in SARIF output as the tool version, so it
	# uses the bare pkgver to match the official GoReleaser binaries, whose
	# {{ .Version }} is the tag with the "v" stripped.
	#
	# No -s -w: leave symbol handling to makepkg's own strip option rather
	# than hardcoding it here.
	CGO_ENABLED=1 go build \
		-ldflags "-linkmode=external -X main.version=$pkgver" \
		-o build/cephalote ./cmd/cephalote

	local sh
	for sh in bash zsh fish; do
		build/cephalote completion "$sh" >"build/completion.$sh"
	done
}

check() {
	cd "$_repo-$pkgver"
	# cgo on, as in build(), so the tier that ships is the tier that is tested.
	CGO_ENABLED=1 go test ./...
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
