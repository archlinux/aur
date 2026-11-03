# mdv for the AUR. Every v* tag makes .github/workflows/release.yml rewrite
# pkgver, pkgrel, source and sha256sums here and in .SRCINFO, then push both to
# ssh://aur@aur.archlinux.org/mdv.git. After changing anything else in this
# file, regenerate the metadata: cd aur && makepkg --printsrcinfo >.SRCINFO
# Maintainer: Eran <erans@users.noreply.github.com>
pkgname=mdv
pkgver=0.1.1
pkgrel=1
pkgdesc='Terminal markdown viewer that follows your desktop palette, with inline images and rendered mermaid diagrams'
arch=(x86_64 aarch64)
url='https://github.com/erans/mdv'
license=(MIT)
makedepends=(go) # go.mod wants go >= 1.26.0
optdepends=('xdg-utils: open document links in your browser')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f82277b09e9cd102fb4ecdc73f525238f89e33006bce4247e1d8728a7a2a2410')

build() {
	cd "$pkgname-$pkgver"
	# static, but PIE with full RELRO so it passes namcap's hardening checks
	export CGO_ENABLED=0 GOFLAGS='-mod=readonly -trimpath -buildmode=pie'
	go build -ldflags "-s -w -bindnow -X main.version=v$pkgver" -o mdv .
	# man page and completions come from the binary, so they cannot drift
	./mdv -man > mdv.1
	./mdv -completions bash > mdv.bash
	./mdv -completions zsh > _mdv
	./mdv -completions fish > mdv.fish
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 mdv "$pkgdir/usr/bin/mdv"
	install -Dm644 mdv.1 "$pkgdir/usr/share/man/man1/mdv.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 mdv.bash "$pkgdir/usr/share/bash-completion/completions/mdv"
	install -Dm644 _mdv "$pkgdir/usr/share/zsh/site-functions/_mdv"
	install -Dm644 mdv.fish "$pkgdir/usr/share/fish/vendor_completions.d/mdv.fish"
}
