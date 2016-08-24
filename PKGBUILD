# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=rustup
pkgver=0.6.1
pkgrel=2

pkgdesc="The Rust toolchain installer"
arch=('i686' 'x86_64')
url="https://github.com/rust-lang-nursery/rustup.rs"
license=('MIT' 'Apache')
makedepends=('cargo')
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly')
conflicts=('rust' 'cargo' 'rust-nightly' 'rust-nightly-bin' 'multirust' 'multirust-git')
replaces=('multirust' 'multirust-git')
install='post.install'

source=("rustup-${pkgver}.tar.gz::https://github.com/rust-lang-nursery/rustup.rs/archive/${pkgver}.tar.gz")
md5sums=('46ff5d949792b92c3d848272534537cc')

prepare() {
	# instead of building directly in -$pkgver, we copy files over into a
	# shared directory -- this may allow for incremental builds
	test -e "$srcdir/$pkgname.rs" || mkdir "$srcdir/$pkgname.rs"
	cp -r "$srcdir/$pkgname.rs-${pkgver}"/* "$srcdir/$pkgname.rs/"
	rm -rf "$srcdir/$pkgname.rs-${pkgver}"
}

build() {
	msg2 "Building rustup"
	cd "$srcdir/$pkgname.rs"
	cargo build --release --features no-self-update --bin rustup-init

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
