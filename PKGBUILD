# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=zsh-patina
pkgver=1.12.0
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
url='https://github.com/michel-kraemer/zsh-patina'
arch=(x86_64 armv7h aarch64 riscv64)
depends=(libgcc glibc)
makedepends=(git cargo clang)
license=('MIT')

source=("git+$url.git#tag=$pkgver")
b2sums=('0920ac846e41f5011658a8d1c5f2c49df31ce42fc9c9ca1fc092fa6181d6011f4ea19de9ded47883d0c8637f47c87680a42685b079957cc6fde88558df154928')

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
