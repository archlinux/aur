# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=cargo-afl
pkgver=0.15.19
pkgrel=1
pkgdesc="Fuzzing Rust code with AFLplusplus"
arch=(x86_64)
url="https://github.com/rust-fuzz/afl.rs"
license=('Apache-2.0')
depends=(glibc gcc-libs)
makedepends=(cargo git)
options=(!debug !lto)
source=("git+https://github.com/rust-fuzz/afl.rs.git#tag=v$pkgver"
	"git+https://github.com/AFLplusplus/AFLplusplus.git#tag=v4.32c")
md5sums=('SKIP'
         'SKIP')
sha256sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "afl.rs"

    git submodule init
    git config submodule.cargo-afl/AFLplusplus.url "$srcdir/AFLplusplus"
    git -c protocol.file.allow=always submodule update

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "afl.rs"

    cargo build --frozen --release --all-features --target-dir target
}

package() {
    cd "afl.rs"

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-afl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
