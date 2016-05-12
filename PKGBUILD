# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=rustup-git
pkgver=0.1.9.r4.ga4ad83f
pkgrel=1
pkgdesc="The Rust toolchain installer"
arch=('any')
url="https://github.com/rust-lang-nursery/rustup.rs"
license=('MIT' 'Apache')
makedepends=('cargo-nightly' 'git')
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly' 'rustup')
conflicts=('rust' 'cargo' 'rust-nightly' 'rust-nightly-bin' 'multirust' 'multirust-git' 'rustup')
replaces=('multirust' 'multirust-git')
install='post.install'
source=("${pkgname}::git+https://github.com/rust-lang-nursery/rustup.rs.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
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
	cd "$pkgname"
	install -dm755 "$pkgdir/usr/bin"
	cp "$srcdir/tmp/.cargo/bin"/* "$pkgdir/usr/bin/"
}

# vim:filetype=sh:
