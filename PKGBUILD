# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=cargo-afl
pkgver=0.17.1
pkgrel=1
pkgdesc="Fuzzing Rust code with AFLplusplus"
arch=(x86_64)
url="https://github.com/rust-fuzz/afl.rs"
license=('Apache-2.0')
depends=(glibc gcc-libs)
makedepends=(cargo git)
options=(!debug !lto)
source=("git+https://github.com/rust-fuzz/afl.rs.git#tag=v$pkgver"
	"git+https://github.com/AFLplusplus/AFLplusplus.git#commit=afbcb07")
sha256sums=('19e5fc96c0672a6a068d8872618ce8776130c43c39a0ad8513f60acc50869038'
            '1759a74a078b5d64827b41ca3b489aef08e21b6bf9468c3bb82951f1040026e1')
b2sums=('1c86b83954da532be1819cb28619add8102b8f389b75fee741c40c498626b8488424ea8e334b4d7ff5ab286e38c1a679aa1ee88eb21ae475bd324750bd9d4f9b'
        '705f5cdec8b7efeb47f21ec75784e11e152220b5a5544f8665846401517f6b8520560a7891a21bc541aef6cf1c417d8f69b1205020f2783a93b19a29bdda94e2')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "afl.rs" || exit

    git submodule init
    git config submodule.cargo-afl/AFLplusplus.url "$srcdir/AFLplusplus"
    git -c protocol.file.allow=always submodule update

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
