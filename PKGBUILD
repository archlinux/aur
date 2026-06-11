# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm
pkgver=1.0.3
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
)
options=(!lto !debug)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "smolvm.sh"
)
sha256sums=(
    '65aa38bec3f44a079599f67c3229722ed6d3cd99224c1ae0af6c7e4b4fa31d5d'
    'a938ec07ef7ac4719cf3c02f34ce5ddc92cdfd7028f31a6c1090bebe0b2c5f26'
)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    git submodule update --init --recursive --depth 1
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
    install -Dm755 ../smolvm.sh "$pkgdir/usr/bin/smolvm"
    install -d "$pkgdir/usr/lib/smolvm/"
    cp -a target/agent-rootfs/ "$pkgdir/usr/lib/smolvm/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
