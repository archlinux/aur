# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud
pkgver=1.0.12+dd1de6b
_commit=dd1de6b009a76383950585eddce59c48415acb53
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=(x86_64)
url="https://github.com/eraden/amdgpud"
license=(Apache-2.0 MIT)
depends=(gcc-libs libxcb)
makedepends=(cargo-nightly cmake git shaderc)
backup=("etc/$pkgname/config.toml")
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('df4d93bbb9b3d37372a0045339e46cc798db7af63a1076df04a548ef9e386da6')
validpgpkeys=(
    '0768AEEA335417256AEEA0910012845A89C7352B' ## Adrian Wozniak
    '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)
## use command below to import public key
## curl https://github.com/eraden.gpg | gpg --import

prepare() {
    export RUSTUP_TOOLCHAIN=nightly
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --release --frozen --all
}

check() {
    export RUSTUP_TOOLCHAIN=nightly
    cd "$pkgname"
    cargo test --frozen --all
}

package() {
    cd "$pkgname"
    find "target/release/" \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -D -t "$pkgdir/usr/bin/" '{}' \+
    find services \
        -type f \
        -name '*.service' \
        -exec install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" '{}' \+
    install -Dm644 LICENSE.APACHE2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 examples/default_config.toml "$pkgdir/etc/$pkgname/config.toml"
}
