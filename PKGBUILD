# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=rustup
pkgver=0.1.12
pkgrel=1

# we (currently) need to build using nightly
# this can hopefully go away eventually
rustv="nightly"
chn=$(echo "$rustv" | tr '-' ' ' | cut -d' ' -f1)
date=$(echo "$rustv" | tr '-' ' ' | cut -d' ' -f2- | tr ' ' '-')
sep="/"
if [ "$date" == "$rustv" ]; then
	date=""
	sep=""
fi
if test -n "$date"; then
	date="-$date"
fi
target="rust-$chn-$CARCH-unknown-linux-gnu"

pkgdesc="The Rust toolchain installer"
arch=('i686' 'x86_64')
url="https://github.com/rust-lang-nursery/rustup.rs"
license=('MIT' 'Apache')
makedepends=() #'cargo-nightly'
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly')
conflicts=('rust' 'cargo' 'rust-nightly' 'rust-nightly-bin' 'multirust' 'multirust-git')
replaces=('multirust' 'multirust-git')
install='post.install'
source=(
	"${pkgname}-${pkgver}.tgz::https://github.com/rust-lang-nursery/rustup.rs/archive/${pkgver}.tar.gz"
	"$target$date.tar.gz::https://static.rust-lang.org/dist/${date#-}${sep}${target}.tar.gz"
	"$target$date.tar.gz.asc::https://static.rust-lang.org/dist/${date#-}${sep}${target}.tar.gz.asc"
)
# The Rust GPG Key: https://keybase.io/rust
validpgpkeys=("108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE")
md5sums=('22751775435b3a37f3893b130e5e5d49'
         '4fcae8ac4b3bc2adcba2e1f6f47544b9'
         'SKIP')

build() {
	# set up nightly cargo
	cd "$srcdir/$target"
	msg2 "Setting up cargo $chn ${date#-}"
	./install.sh --prefix="$srcdir/cargo"
	export PATH="$srcdir/cargo/bin:$PATH"

	msg2 "Building rustup"
	cd "$srcdir/$pkgname.rs-$pkgver"
	cargo build --release --bin rustup-init

	msg2 "Running rustup-init"
	mkdir -p "$srcdir/tmp/.cargo"
	env -u CARGO_HOME "HOME=$srcdir/tmp" target/release/rustup-init -y --no-modify-path
}

package() {
	cd "$pkgname.rs-$pkgver"
	install -dm755 "$pkgdir/usr/bin"
	cp "$srcdir/tmp/.cargo/bin"/* "$pkgdir/usr/bin/"
}

# vim:filetype=sh:
