# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="kittehlist-git"
pkgdesc="todo list for kittehs - development version"
arch=("x86_64" "aarch64" "riscv64")
url="https://codeberg.org/annaaurora/kittehlist"
license=("MIT" "Apache-2.0")
source=("git+https://codeberg.org/annaaurora/kittehlist.git")
b2sums=("SKIP")

depends=("postgresql-libs" "zstd" "libgcc")
makedepends=("git" "jq" "rustup" "clang" "wasm-pack" "just" "esbuild" "minify")
options=(!debug !lto)

pkgrel=2
pkgver=0.1.0.r92e8804
pkgver() {
	cd "${srcdir}/kittehlist"
	ver=$(cargo metadata --frozen --no-deps --format-version 1 | jq -r '.packages | map(select(.name == "kittehlist"))[0].version')
	rev=$(git rev-parse --short=7 HEAD)
	echo "${ver}.r${rev}"
}

prepare() {
	cd "${srcdir}/kittehlist"

	rustup install stable
	cargo --version
	cargo --locked fetch
}

build() {
	cd "${srcdir}/kittehlist"
	just build-release
}

package() {
	cd "${srcdir}/kittehlist"
	install -D target/releash/kittehlist_server "${pkgdir}/usr/bin/kittehlist"
	pushd target
	find frontend -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/kittehlist/{}" \;
	popd
	# TODO: example config, systemd files
}

check() {
	cd "${srcdir}/kittehlist"
	target/releash/kittehlist_server --version
}
