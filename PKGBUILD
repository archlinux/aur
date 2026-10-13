# Maintainer: Mark Roboff <mark.roboff@bluecircuit.ai>
pkgname=vm-curator
pkgver=1.5.0
pkgrel=1
pkgdesc="A TUI application to manage QEMU/KVM VMs"
arch=('x86_64')
url="https://github.com/mroboff/vm-curator"
license=('MIT')
# qemu-desktop (not qemu-base): qemu-base is the headless build with no GTK/SDL/
# SPICE display or audio modules, which leaves VMs unable to open a window.
depends=('gcc-libs' 'systemd-libs' 'qemu-desktop')
makedepends=('cargo' 'systemd')
optdepends=(
    'edk2-ovmf: UEFI boot support'
    'swtpm: TPM 2.0 emulation for Windows 11'
    'passt: fast user-mode networking'
    'virt-viewer: SPICE display (spice-app)'
    'dnsmasq: DHCP for managed virtual networks'
    'samba: SMB-mode shared folders for Windows guests'
    'polkit: privilege escalation for PCI/bridge setup'
    'qemu-system-arm: ARM/AArch64 VM support'
    'qemu-system-ppc: PowerPC VM support'
    'qemu-system-m68k: m68k (classic Mac) VM support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mroboff/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8049fc7bf1990734f9786de669353a05b3a4a3a25e98f1059a1e9da0225d8b91')

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
