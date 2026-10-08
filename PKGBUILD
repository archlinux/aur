# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=zsh-patina
pkgver=1.11.0
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
url='https://github.com/michel-kraemer/zsh-patina'
arch=(x86_64 armv7h aarch64 riscv64)
depends=(libgcc glibc)
makedepends=(git cargo clang)
license=('MIT')

source=("git+$url.git#tag=$pkgver")
b2sums=('27b87b7c45327c6351b65110decab3a4cedcac3bc56c2b5f188b1136de2f51ec9dbe44cba37740a6bced2faae0bcb4a478cb7b218636a706a47be6fc4689b21d')

prepare() {
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --profile release-lto
	"./target/release-lto/$pkgname" completion > "_$pkgname"
}

check() {
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	CC=clang CXX=clang++ cargo test --frozen --profile release-lto
}

package() {
	install -Dm755 "$srcdir/$pkgname/target/release-lto/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/$pkgname/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
