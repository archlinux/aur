# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="uptime-miku-git"
pkgdesc="uptime monitoring with hatsune miku - development version"
arch=("x86_64" "aarch64" "riscv64")
url="https://codeberg.org/filmroellchen/uptime-miku"
license=("MIT" "Apache-2.0")
source=("git+https://codeberg.org/filmroellchen/uptime-miku.git")
b2sums=("SKIP")

pkgrel=2
pkgver=0.1.1.r65ace05

provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
# "zstd"
depends=("postgresql-libs" "sqlite" "libgcc")
makedepends=("git" "jq" "rustup" "just" "cargo-leptos")
options=(!debug !lto)

pkgver() {
	cd "${srcdir}/uptime-miku"
	ver=$(cargo metadata --frozen --no-deps --format-version 1 | jq -r '.packages | map(select(.name == "uptime-miku-server"))[0].version')
	rev=$(git rev-parse --short=7 HEAD)
	echo "${ver}.r${rev}"
}

prepare() {
	cd "${srcdir}/uptime-miku"

	rustup install --profile minimal nightly
	rustup install --profile minimal --default stable
	rustup target add wasm32-unknown-unknown
	cargo --locked fetch

	chmod +x scripts/*.rs
}

build() {
	cd "${srcdir}/uptime-miku"

	# env
	# which cargo
	# base RUSTFLAGS contain --icf=safe for the linker, which rust-lld does not understand; only keep FFP
	export RUSTFLAGS='-C force-frame-pointers=yes'
	just build-release
	# cargo +stable leptos build -v --release
	# cargo +stable build --package=uptime-miku-frontend --lib --target-dir=target/front --target=wasm32-unknown-unknown --no-default-features --profile=wasm-release
	# cargo +stable build --package=uptime-miku-server --bin=uptime-miku-server --no-default-features --release
	# scripts/compile-style.rs
}

package() {
	cd "${srcdir}/uptime-miku"
	install -vD target/release/uptime-miku-server "${pkgdir}/usr/bin/uptime-miku"
	install -vDm644 -t "${pkgdir}/usr/share/licenses/uptime-miku" UNLICENSE
	install -vD assets/res/fonts/LICENSE.txt "${pkgdir}/usr/share/licenses/uptime-miku/LICENSE-OFL"
	pushd target
	find frontend-release -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/uptime-miku/{}" \;
	popd
	mv "${pkgdir}/usr/share/uptime-miku/frontend-release" "${pkgdir}/usr/share/uptime-miku/frontend"
	install -vD etc/uptime-miku.kdl "${pkgdir}/etc/uptime-miku.kdl"
	# TODO: systemd files
}

check() {
	cd "${srcdir}/uptime-miku"
	target/release/uptime-miku-server --version
}
