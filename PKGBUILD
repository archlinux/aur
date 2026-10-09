# Maintainer: fuero <fuerob@gmail.com>
pkgname=sofka
# renovate: datasource=github-releases depName=nklmilojevic/sofka
pkgver=0.31.4
pkgrel=1
pkgdesc='Kubernetes TUI, reimagined in Rust'
url='https://github.com/nklmilojevic/sofka'
license=('Apache-2.0' 'MIT')
makedepends=('cargo' 'clang')
depends=('glibc' 'libgcc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
  cc-wrapper.sh
)
sha256sums=('a109106f8db1e3748b7600bb2b6ba0ee2df9125792a05d7dde868f31aa8fb33f'
            '5cb813a99ae932d5e1273a3a4f7d109c4db9e1dd1b406512c50862a00279f1f0')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${pkgname}-${pkgver}"
    # aws-lc-sys-0.45.0/aws-lc/third_party/jitterentropy/jitterentropy-library/src/jitterentropy-base.c:47:3: error: "The CPU Jitter random number generator must not be compiled with optimizations. See documentation. Use the compiler switch -O0 for compiling jitterentropy.c."
    # cargo:warning=   47 |  #error "The CPU Jitter random number generator must not be compiled with optimizations. See documentation. Use the compiler switch -O0 for compiling jitterentropy.c."
    export CC=${srcdir}/cc-wrapper.sh ORIG_CC=clang
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    export CC=${srcdir}/cc-wrapper.sh ORIG_CC=clang
    RUST_BACKTRACE=1 LANG=C LC_ALL=C cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}" *.md docs/*.md
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
