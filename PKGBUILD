# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=rustup
pkgver=0.3.0
pkgrel=1

pkgdesc="The Rust toolchain installer"
arch=('i686' 'x86_64')
url="https://github.com/rust-lang-nursery/rustup.rs"
license=('MIT' 'Apache')
makedepends=()
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly')
conflicts=('rust' 'cargo' 'rust-nightly' 'rust-nightly-bin' 'multirust' 'multirust-git')
replaces=('multirust' 'multirust-git')
install='post.install'

rust="rust-1.9.0-$CARCH-unknown-linux-gnu"
source=(
	#"git+https://github.com/rust-lang-nursery/rustup.rs.git#tag=${pkgver}"
	"git+https://github.com/rust-lang-nursery/rustup.rs.git#commit=7d7fed264d9cedf431a44974454e27eedc8182cd" # commit hasn't been tagged yet
	"https://static.rust-lang.org/dist/${rust}.tar.gz"{,.asc}
)
# The Rust GPG Key: https://keybase.io/rust
validpgpkeys=("108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE")
md5sums=('SKIP'
         'dc994c38b56c97081a5006c7553a55e1'
         'SKIP')

build() {
	# set up cargo
	cd "$srcdir/$rust"
	msg2 "Setting up cargo"
	./install.sh --prefix="$srcdir/cargo"
	export PATH="$srcdir/cargo/bin:$PATH"

	msg2 "Building rustup"
	cd "$srcdir/$pkgname.rs"
	cargo build --release --bin rustup-init

	msg2 "Running rustup-init"
	mkdir -p "$srcdir/tmp/.cargo"
	env -u CARGO_HOME "HOME=$srcdir/tmp" target/release/rustup-init -y --no-modify-path
}

package() {
	cd "$pkgname.rs"
	install -dm755 "$pkgdir/usr/bin"
	cp "$srcdir/tmp/.cargo/bin"/* "$pkgdir/usr/bin/"
}

# vim:filetype=sh:
