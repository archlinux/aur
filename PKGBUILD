# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=freq
pkgver=0.9.2
pkgrel=1
pkgdesc='A tool for counting frequency of items and showing related statistics, like `sort | uniq -c | sort -rn` but better'
url='https://github.com/ryancdotorg/freq'
license=(
    # the upstream README and included license files are quite explicit:
    # not “GPL v2 or later” but “GPL v2 or v3”
    'GPL-2.0-only'
    'GPL-3.0-only'
)
makedepends=(
    'cargo'
)
depends=(
    'gcc-libs'
    'glibc'
)
arch=(
    'x86_64'
)
options=(
    # disable LTO, causes linker errors (excerpt):
    # error: linking with `cc` failed: exit status: 1
    # /usr/bin/ld: …: in function `zstd_safe::CCtx::end_stream': … undefined reference to `ZSTD_endStream'
    # (ditto ZSTD_compressStream, ZSTD_isError, ZSTD_createCCtx, ZSTD_CCtx_loadDictionary,
    # ZSTD_CCtx_reset, ZSTD_CCtx_setParameter, ZSTD_freeCCtx, ZSTD_getErrorName)
    # collect2: error: ld returned 1 exit status
    '!lto'
)
source=(
    "source-v${pkgver}.tar.gz::https://github.com/ryancdotorg/freq/releases/download/v${pkgver}/source.tar.gz"
)
sha256sums=(
    'eb770eeaf5a4322532ea3b8edcaf4e19505aecc0a413c1c2611ced0dcc663486'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
