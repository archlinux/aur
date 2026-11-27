# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=cargo-afl
pkgver=0.19.0
_commit='066b9e61d3b7cfd630ae16c517a0e9229cca53bb'
pkgrel=1
pkgdesc="Fuzzing Rust code with AFLplusplus"
arch=(x86_64)
url="https://github.com/rust-fuzz/afl.rs"
license=('Apache-2.0')
depends=(glibc libgcc)
makedepends=(rust git)
options=(!debug !lto)
source=("git+https://github.com/rust-fuzz/afl.rs.git#commit=$_commit"
	# AFLplusplus is afl.rs's git submodule, so it lives under its own GitHub org.
	# pkglint: ignore=PB109
	"git+https://github.com/AFLplusplus/AFLplusplus.git#commit=afbcb07")
sha256sums=('0d3349aaf31aea18b16b7bd5bc886f8bd9999e7b30103dca6ecaa69e3f4baad7'
            '1759a74a078b5d64827b41ca3b489aef08e21b6bf9468c3bb82951f1040026e1')
b2sums=('bf808a0839e6c145d1da7701d02370ae3615881934aa7373a5228dd6c6f0a09d75edd51f09ec223ce43621d6a2815c765a4b3cda5b6c89052cc86bca72149c1a'
        '705f5cdec8b7efeb47f21ec75784e11e152220b5a5544f8665846401517f6b8520560a7891a21bc541aef6cf1c417d8f69b1205020f2783a93b19a29bdda94e2')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "afl.rs" || exit

    git submodule init
    git config submodule.cargo-afl/AFLplusplus.url "$srcdir/AFLplusplus"
    git -c protocol.file.allow=always submodule update

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "afl.rs" || exit

    cargo build --frozen --release --all-features --target-dir target
}

package() {
    cd "afl.rs" || exit

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-afl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
