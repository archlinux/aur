# Maintainer: Alexandre Fiori <fiorix@gmail.com>
#
# Versionless template. packaging/distros/arch/make-aur-package.sh renders the
# release version, pkgrel, source location, and checksum into the AUR metadata.

pkgname=chan
pkgver=0.79.0
pkgrel=1
pkgdesc='AI-native IDE with an embedded web editor'
# Native CI builds both architectures; aarch64 is observed-only for v0.73.0.
arch=('x86_64' 'aarch64')
url='https://chan.app'
license=('Apache-2.0')
# namcap derives dependencies from linked sonames alone and calls both
# gcc-libs and systemd possibly unneeded. They are needed: gcc-libs provides
# the libgcc_s.so.1 the binary links, and systemd carries the packaged user
# unit's runtime plus `chan devserver --service=systemd`.
depends=('gcc-libs' 'glibc' 'systemd')
makedepends=('cargo' 'nodejs' 'npm')
conflicts=('chan-desktop')
# Cargo owns thin LTO. makepkg's additional -flto=auto reaches native C/C++
# dependencies and can leave rustc unable to resolve their symbols at link time.
options=(!lto)
source=('chan-0.79.0.tar.gz::https://github.com/fiorix/chan/archive/v0.79.0.tar.gz')
sha256sums=('acab3f1620c4bae54e9b76c5ac82cf78a6ffa607346e86d84d5e1720491717c4')

# RUSTUP_TOOLCHAIN keeps the tree's rust-toolchain.toml pin from making a
# rustup-provided cargo download a second toolchain mid-build, per Arch's Rust
# packaging guidelines. A plain rust package ignores it.
prepare() {
    cd "chan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    npm --prefix web ci
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "chan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CHAN_PACKAGED=aur
    make web WEB_SKIP_INSTALL=1
    cargo build --frozen --release -p chan
}

check() {
    cd "chan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CHAN_PACKAGED=aur
    cargo test --frozen --release -p chan
}

package() {
    cd "chan-$pkgver"
    install -Dm755 target/release/chan "$pkgdir/usr/bin/chan"
    ln -s chan "$pkgdir/usr/bin/cs"
    install -Dm644 packaging/distros/shared/chan-devserver.service \
        "$pkgdir/usr/lib/systemd/user/chan-devserver.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chan/LICENSE"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/chan/"
}
