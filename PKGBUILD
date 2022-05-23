# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=packwiz-bin
pkgver=r211.e71b63e
pkgrel=1
pkgdesc='A command line tool for editing and distributing Minecraft modpacks (Git auto-update)'
arch=('x86_64' 'aarch64')
url='https://packwiz.infra.link/'
license=('MIT')
source_x86_64=("packwiz-x86_64-$pkgver.zip::https://nightly.link/packwiz/packwiz/workflows/go/master/Linux%2064-bit%20x86.zip")
source_aarch64=("packwiz-aarch64-$pkgver.zip::https://nightly.link/packwiz/packwiz/workflows/go/master/Linux%2064-bit%20ARM.zip")
provides=('packwiz')
conflicts=('packwiz' 'packwiz-git')
makedepends=('curl' 'git' 'htmlq')
sha256sums_x86_64=('6312fdfeee415125eee2cb1993ceff8cf85123852269ed7cb5917b05867173d1')
sha256sums_aarch64=('b633a432d2a29387b0e137ccdc5d60bb80ba3902517dedf629cb05df45823b8c')

pkgver() {
	commit_count="$(curl 'https://github.com/packwiz/packwiz/' | htmlq --text '.d-sm-inline strong')"
	commit_hash="$(git ls-remote --heads 'https://github.com/packwiz/packwiz/' | head -n1 | cut -c1-7)"
	printf 'r%s.%s' "$commit_count" "$commit_hash"
}

package() {
	install -Dm755 packwiz -t "$pkgdir/usr/bin"
	chmod +x packwiz
	./packwiz completion bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/packwiz
	./packwiz completion zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_packwiz
	./packwiz completion fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/packwiz.fish
}
