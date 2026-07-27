# Maintainer: Mark Roboff <mark.roboff@bluecircuit.ai>
pkgname=vm-curator
pkgver=1.2.3
pkgrel=1
pkgdesc="A TUI application to manage QEMU/KVM VMs"
arch=('x86_64')
url="https://github.com/mroboff/vm-curator"
license=('MIT')
depends=('gcc-libs' 'systemd-libs' 'qemu-base')
makedepends=('cargo' 'systemd')
optdepends=(
    'qemu-system-x86: x86/x86_64 VM support'
    'qemu-system-arm: ARM/AArch64 VM support'
    'qemu-system-ppc: PowerPC VM support'
    'edk2-ovmf: UEFI boot support'
    'polkit: privilege escalation for KVM'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mroboff/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c13fd88c1aeeab8619981f1389ac0b3f97972aa8b3b236cfe97a32121bf5211a')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
