# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="compendium"
_cratever="0.2.1"
pkgname="compendium"
pkgver=0.2.1
pkgrel=1
pkgdesc='A user-friendly strace for x86 Linux with HTML reports'
url='https://crates.io/crates/compendium'
license=('MIT')

depends=('libgcc' 'libbpf')
makedepends=('cargo' 'cargo-auditable' 'bpf' 'clang')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/compendium/0.2.1/download"
        'dynamic-linking.patch')
sha512sums=('def2d458410718934f12b123717ce196a4b37f52d94e41b2abad2522ce5b80b06a7c94ceabbcb5edcb53619152dbc9f51268d8757f001c3c3887651681b7e4eb'
            'cd0213a05271d5cb93afcd3b1e0bdda52d6eea16664add9b9e287f480646ec18384ddc4843151916d9116caa7f119acc8bdace4082e95eb12681c885ae064624')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"
	
	patch -Np0 -i "$srcdir/dynamic-linking.patch"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	find . -name '*.o' -delete
	bpftool btf dump file /sys/kernel/btf/vmlinux format c >bpf/vmlinux.h
	clang -O2 -g -target bpf -D__TARGET_ARCH_$(uname -m | sed 's,x86_64,x86,') -Ibpf -c bpf/compendium.bpf.c -o bpf/compendium.bpf.o

	cargo auditable build \
		--frozen \
		--release
}

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--frozen \
		--release \
		"${@}"
}

check() {
	_check --bins
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/compendium" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
