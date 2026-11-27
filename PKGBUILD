# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="spcasm"
pkgver="2.0.1"
pkgrel=1
pkgdesc="Modern SPC700 toolchain"
arch=("x86_64" "aarch64" "riscv64")
url="https://codeberg.org/filmroellchen/spcasm"
license=("BSD-2-Clause")
source=("spcasm::${url}/archive/v${pkgver}.tar.gz")
b2sums=("39baa88de5cf09d49f23d299e1f39d0790ba0a3e7873595dbbd89f083f04eb73592d3278cd4c9882fc49dd2d9ec36fc501c09b33a590a62a2a71d96dfb2326d1")
provides=("sapemu" "brr")
conflicts=("spcasm-git" "spcasm-bin")

depends=("libgcc" "glibc")
makedepends=("rustup" "clang")
options=(!debug !lto)

prepare() {
	cd "${srcdir}/spcasm"

	rustup install
	cargo --version
	cargo --locked fetch
}

build() {
	cd "${srcdir}/spcasm"
	RUSTFLAGS='' cargo build --locked --offline --workspace --profile=spcasm-release --features human-panic
}

package() {
	cd "${srcdir}/spcasm"
	install -vD target/spcasm-release/spcasm "${pkgdir}/usr/bin/spcasm"
	install -vD target/spcasm-release/brr "${pkgdir}/usr/bin/brr"
	install -vD target/spcasm-release/sapemu "${pkgdir}/usr/bin/sapemu"
	install -vDm644 -t "${pkgdir}/usr/share/licenses/spcasm" LICENSE
	pushd include
	find . -type f -exec install -vDm644 "{}" "${pkgdir}/usr/include/spcasm/{}" \;
	popd
}

check() {
	cd "${srcdir}/spcasm"
	
	target/spcasm-release/spcasm --version
	target/spcasm-release/brr --version

	RUSTFLAGS='' cargo --locked --offline test --workspace
}
