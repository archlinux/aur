# Maintainer: Diptesh Choudhuri <diptesh.choudhuri@gmail.com>
pkgname=printr-git
pkgver=0.1.2
pkgrel=1
pkgdesc="The smarter echo alternative"
arch=('i686' 'x86_64')
url="https://github.com/IgnisDa/printr"
license=('Apache-2.0')
provides=("printr")
makedepends=('cargo' 'git' 'asciidoc')
optdepends=('fish: fish completions')
conflicts=("printr")
source=("$pkgname::git+https://github.com/IgnisDa/printr")
sha1sums=('SKIP')

build() {
  	cd "$pkgname"
  	if command -v rustup > /dev/null 2>&1; then
  	  RUSTFLAGS="-C target-cpu=native" rustup run nightly \
  	    cargo build --release
  	elif rustc --version | grep -q nightly; then
  	  RUSTFLAGS="-C target-cpu=native" \
  	    cargo build --release
  	else
  	  cargo build --release
  	fi
}

pkgver() {
	cd "$pkgname"
	printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/printr" "$pkgdir/usr/bin/printr"
	outdir="$(ci/cargo-out-dir "./target")"
	install -Dm644 "$outdir/_printr" "$pkgdir/usr/share/zsh/site-functions/_printr"
	install -Dm644 "$outdir/printr.bash" "$pkgdir/usr/share/bash-completion/completions/printr"
	install -Dm644 "$outdir/printr.fish" "$pkgdir/usr/share/fish/vendor_completions.d/printr.fish"
	a2x --no-xmllint --doctype manpage --format manpage "$outdir/printr.1.txt"
	install -Dm644 "$outdir/printr.1" "$pkgdir/usr/share/man/man1/printr.1"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
