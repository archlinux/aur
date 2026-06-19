# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm-git
_pkgname=smolvm
pkgver=0.7.1.r11.gfea85d2
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
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
    'gzip'
    'tar'
)
makedepends=(
    'cargo'
    'curl'
    'tar'
    'busybox'
    'alpine-sdk'
    'git'
)
options=(
    !lto
    !debug
)
provides=('smolvm')
conflicts=('smolvm' 'smolvm-bin')
source=(
    "$_pkgname-main::git+$url.git#branch=main"
    'use-system-libs.patch'
)
sha256sums=(
    'SKIP'
    'dc2b8c9f866cd48a10522c2d5d6d62af038c9d60998e79ca45c986605b19678e'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    git apply ../use-system-libs.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo make build-agent
    cargo make agent-rootfs
    cargo make build
}

package() {
    cd "${_pkgname}-main"
    install -Dm755 target/release/smolvm "$pkgdir/usr/bin/smolvm-bin"
    install -Dm755 scripts/smolvm-wrapper.sh "$pkgdir/usr/bin/smolvm"
    install -d "$pkgdir/usr/lib/smolvm/"
    cp -a target/agent-rootfs/ "$pkgdir/usr/lib/smolvm/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
