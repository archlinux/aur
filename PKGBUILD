# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="spcasm"
pkgver="2.0.0"
pkgrel=1
pkgdesc="Modern SPC700 toolchain"
arch=("x86_64" "aarch64" "riscv64")
url="https://codeberg.org/annaaurora/kittehlist"
license=("BSD-2-Clause")
source=("spcasm::https://codeberg.org/filmroellchen/spcasm/archive/v${pkgver}.tar.gz")
b2sums=("fcb797608681b5890e62e3fcb9c6cb0c36639dd43a30096866b43a94820419bf8021cf92d45171f4be19f5b8c17635fb31feb1fb31b1c25864ebe2368b933375")
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
	cargo build --locked --offline --workspace --profile=spcasm-release --features human-panic
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

	cargo --locked --offline test --workspace
}
