# This file is part of domainager's release tooling.
# Publish: copy to a fresh AUR repo (git clone aur:domainager), review, then
# run `updpkgsums` and `makepkg --printsrcpage > .SRCINFO`, commit and push.
#
# The package builds from the sr.ht source archive, so it needs no hosted
# release artifacts. man pages and shell completions are generated during
# build() exactly like the goreleaser hooks do.
pkgname=domainager
pkgver=1.0.3
pkgrel=1
pkgdesc="Domain management CLI for multiple registrars (Namecheap, Cloudflare, Njalla)"
arch=(x86_64 aarch64)
url="https://git.sr.ht/~drzoidberg/domainager"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bdc9a1804f5dc9bcc2d7ea05c26873c237f64bff18b5990537ac0901bf45053f')

build() {
	cd "$pkgname-v$pkgver"

	export CGO_ENABLED=0
	local LDFLAGS="-s -w -X git.sr.ht/~drzoidberg/domainager/internal/cli.Version=v$pkgver"

	go build -trimpath -ldflags "$LDFLAGS" -o domainager ./cmd/domainager

	# Generated docs, matching the goreleaser before-hooks.
	go run ./cmd/genman man
	mkdir -p completions
	go run ./cmd/domainager completion bash > completions/domainager.bash
	go run ./cmd/domainager completion zsh > completions/_domainager
	go run ./cmd/domainager completion fish > completions/domainager.fish
}

check() {
	cd "$pkgname-v$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-v$pkgver"

	install -Dm755 domainager -t "$pkgdir/usr/bin/"

	local manpage
	for manpage in man/*.1; do
		install -Dm644 "$manpage" -t "$pkgdir/usr/share/man/man1/"
	done

	install -Dm644 completions/domainager.bash \
		"$pkgdir/usr/share/bash-completion/completions/domainager"
	install -Dm644 completions/_domainager \
		"$pkgdir/usr/share/zsh/site-functions/_domainager"
	install -Dm644 completions/domainager.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/domainager.fish"
}
