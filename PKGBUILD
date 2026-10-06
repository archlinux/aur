# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=zsh-patina
pkgver=1.10.0
pkgrel=3
pkgdesc='A blazingly fast Zsh syntax highlighter'
url='https://github.com/michel-kraemer/zsh-patina'
arch=(x86_64 armv7h aarch64 riscv64)
depends=(libgcc glibc)
makedepends=(git rust)
license=('MIT')

source=("git+$url.git#tag=$pkgver")
b2sums=('3552a8826c146af8daa12e370c2ae20ae69038435d98e3e3e5cfc4f81fdb930f43da9d3a69f08aaf145ea1d8a8d462babd699d8c1bfa9a676ed9e4c8534cd121')

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
