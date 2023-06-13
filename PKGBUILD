# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='rage'
pkgname="rust-$_pkgname-git"
pkgver='0.9.2.r0.g267f383'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - git version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('bzip2' 'fuse3')
makedepends=('cargo' 'git')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Prepare correct target for our architecture
	_cargotarget="$CARCH-unknown-linux-gnu"

	if [ "$CARCH" = 'armv7h' ]; then
		_cargotarget='armv7-unknown-linux-gnueabihf'
	fi

	cargo fetch --locked --target "$_cargotarget"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
	cargo run --frozen --release --all-features --example generate-completions
	cargo run --frozen --release --all-features --example generate-docs
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/target/"
	for _binary in "$_pkgname" "$_pkgname-keygen" "$_pkgname-mount"; do
		install -Dm755 "release/$_binary" "$pkgdir/usr/bin/$_binary"
		install -Dm644 "completions/$_binary.bash" "$pkgdir/usr/share/bash-completion/completions/$_binary"
		install -Dm644 "completions/$_binary.elv" "$pkgdir/usr/share/elvish/lib/$_binary.elv"
		install -Dm644 "completions/$_binary.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binary.fish"
		install -Dm644 "completions/$_binary.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_binary"
		install -Dm644 "manpages/$_binary.1.gz" "$pkgdir/usr/share/man/man1/$_binary.1.gz"
	done
	install -Dm644 '../LICENSE-MIT' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
