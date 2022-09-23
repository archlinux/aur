# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
pkgname="cargo-doc2readme"
pkgver=0.1.7
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache')

depends=('gcc-libs' 'curl' 'libgit2.so=1.5')
makedepends=('cargo' 'libgit2')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-doc2readme/$pkgver/download"
		"https://github.com/rust-lang/cargo/archive/refs/heads/rust-1.64.0.zip"
		"https://github.com/rust-lang/cargo/pull/11004.patch"
		"fix-libgit2-1.5-compat.patch")
sha512sums=('9f9516aee6287c58a42dab3e3047976fa6a3e2d240ce07b126697f801cb93a5eafb33dd66955ff7a79e2d9357c45ab772468fc4665d05328681ee6a9c08f41be'
            'b3de32f0b0e82230d5feb0d1eae35f1b1c7a11bd6e2d9c2d659a0715690c5e98ce02a51a4a1d78d8ed17df8f6a3fd8416eb380d7ab1628820fc521c663bfe68f'
            'ed4b148bbbdc26059278d9170d377f36b4847d3c253fa4e3549354de8e17bb2849a6541048a9438f1880f003c8debea9766737773c856c9acec31b90fb60553f'
            '547046415d7a97ef55a0d5cd9b740af2b5943a5f56feb999cb3d863970b76a934b269b018829a0594d368265c65edda7d9373e2df029435e87204d4214383160')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/cargo-rust-1.64.0"
	patch -N -p1 -i "$srcdir/11004.patch"

	cd "$srcdir/$_crate-$pkgver"
	patch -N -p1 -i "$srcdir/fix-libgit2-1.5-compat.patch"
	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}
