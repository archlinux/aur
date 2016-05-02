# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=rustup
pkgver=0.1.8
pkgrel=1
pkgdesc="The Rust toolchain installer"
arch=('any')
url="https://github.com/rust-lang-nursery/rustup.rs<Paste>"
license=('GPL')
makedepends=('cargo')
provides=('rust' 'cargo' 'rust-nightly')
conflicts=('rust' 'cargo' 'rust-nightly' 'multirust' 'multirust-git')
replaces=('multirust' 'multirust-git')
install='post.install'
source=("${pkgname}-${pkgver}.tgz::https://github.com/rust-lang-nursery/rustup.rs/archive/${pkgver}.tar.gz")
md5sums=('37b65682bee29bcb5acf79e93511f41a')

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
