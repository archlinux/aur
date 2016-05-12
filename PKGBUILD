# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=rustup
pkgver=0.1.10
pkgrel=1
pkgdesc="The Rust toolchain installer"
arch=('any')
url="https://github.com/rust-lang-nursery/rustup.rs"
license=('MIT' 'Apache')
makedepends=('cargo-nightly')
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly')
conflicts=('rust' 'cargo' 'rust-nightly' 'rust-nightly-bin' 'multirust' 'multirust-git')
replaces=('multirust' 'multirust-git')
install='post.install'
source=("${pkgname}-${pkgver}.tgz::https://github.com/rust-lang-nursery/rustup.rs/archive/${pkgver}.tar.gz")
md5sums=('76364213b15e39e0ebee86985def3a7c')

build() {
	cd "$pkgname.rs-$pkgver"
	# we (currently) need to build using beta or nightly
	# this can hopefully go away eventually
	if rustc --version | grep -E 'beta|nightly'; then
		msg2 "Building rustup-init using cargo"
		cargo build --release --bin rustup-init
	elif command -v rustup >/dev/null 2>&1; then
		msg2 "Building rustup-init using old rustup"
		rustup run nightly cargo build --release --bin rustup-init
	elif command -v multirust >/dev/null 2>&1; then
		msg2 "Building rustup-init using multirust"
		multirust run nightly cargo build --release --bin rustup-init
	else
		echo "Could not find beta/nightly cargo to use for compilation"
		exit 1
	fi

	msg2 "Running rustup-init"
	mkdir -p "$srcdir/tmp/.cargo"
	env "HOME=$srcdir/tmp" target/release/rustup-init -y --no-modify-path
}

package() {
	cd "$pkgname.rs-$pkgver"
	install -dm755 "$pkgdir/usr/bin"
	cp "$srcdir/tmp/.cargo/bin"/* "$pkgdir/usr/bin/"
}

# vim:filetype=sh:
