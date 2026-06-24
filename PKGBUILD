# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>

pkgname=fortitude
pkgver=0.9.0
pkgrel=1
pkgdesc='A Fortran linter, inspired by (and built upon) Ruff.'
arch=(x86_64)
url='https://github.com/PlasmaFAIR/fortitude'
license=(MIT)
depends=(glibc libgcc libgit2)
makedepends=(git cargo)
checkdepends=(cargo-nextest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('63cc00a24475e1b44d3b7b03c7435eb46917e1edde92df6a913d9c80fc00140bc5135cdec61a100a6f3fefcbb6e40eaea36688f6220d17197563ad9814728d6b')
b2sums=('8c13414ee7a1f1db2668c2143cc062f0d1b202ccd04c1b965885b71ce7ec993d4aed41a74d4150fe050a0fb289003d17e81e8b5a65fa6242b3b380d7a44a9a9d')
options=('!lto')

prepare() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBGIT2_NO_VENDOR=1
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    # Upstream specifically recommends using nextest in CONTRIBUTING.md
    cargo nextest
}

package() {
    cd "$pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

