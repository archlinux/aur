# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm
pkgver=1.0.4
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=(
    'libkrun'
    'libkrunfw'
    'seatd'
    'crun'
    'jq'
    'e2fsprogs'
    'util-linux'
    'libcap'
)
makedepends=(
    'cargo'
    'curl'
    'tar'
    'busybox'
    'alpine-sdk'
    'cargo-make'
    'patch'
)
options=(!lto !debug)
provides=('smolvm')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'use-system-libs.patch'
)
sha256sums=(
    'f6e0274c93510134abe2be8bfb9ff21e908e49facb5a59f7615fdbdb7828793b'
    'dc2b8c9f866cd48a10522c2d5d6d62af038c9d60998e79ca45c986605b19678e'
)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    patch -p1 < ../use-system-libs.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo make build-agent
    cargo make agent-rootfs
    cargo make build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/smolvm "$pkgdir/usr/bin/smolvm-bin"
    install -Dm755 scripts/smolvm-wrapper.sh "$pkgdir/usr/bin/smolvm"
    install -d "$pkgdir/usr/lib/smolvm/"
    cp -a target/agent-rootfs/ "$pkgdir/usr/lib/smolvm/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
