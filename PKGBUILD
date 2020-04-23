# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname-git"
pkgver='0.4.0.r7.g698d56f'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2')
makedepends=('cargo' 'git')
optdepends=('bash-completion: Bash completion')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cargo build --release --locked --all-features
	cargo run --release --locked --all-features --example generate-completions
	cargo run --release --locked --all-features --example generate-docs
}

package() {
	cd "$srcdir/$_sourcedirectory/target/"
	for _binary in "$_pkgname" "$_pkgname-keygen" "$_pkgname-mount"; do
		install -Dm755 "release/$_binary" "$pkgdir/usr/bin/$_binary"
		install -Dm644 "completions/$_binary.bash" "$pkgdir/usr/share/bash-completion/completions/$_binary"
		install -Dm644 "completions/$_binary.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binary.fish"
		install -Dm644 "completions/$_binary.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_binary"
		install -Dm644 "manpages/$_binary.1.gz" "$pkgdir/usr/share/man/man1/$_binary.1.gz"
	done
	install -Dm644 '../LICENSE-MIT' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
