# Maintainer: Christopher Brown <cjbrown102@gmail.com>
pkgname=pelagos
pkgver=0.60.5
pkgrel=1
pkgdesc="Fast Linux container runtime — OCI-compatible, namespaces, cgroups v2, seccomp, networking, image management"
arch=('x86_64' 'aarch64')
url="https://github.com/pelagos-containers/pelagos"
license=('Apache-2.0')
depends=('nftables' 'iproute2')
optdepends=(
    'passt: rootless networking (pelagos run without sudo)'
    'fuse-overlayfs: rootless overlay filesystem on kernels < 5.11'
    'dnsmasq: production-grade DNS backend for container name resolution'
)
makedepends=('rust' 'cargo')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/pelagos-containers/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7732f497b89ccca764248cabcaa4c62a97988bbbf79d7da9139c827601d0de61')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --lib --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/pelagos          "$pkgdir/usr/bin/pelagos"
    install -Dm755 target/release/pelagos-dns       "$pkgdir/usr/bin/pelagos-dns"
    install -Dm755 target/release/pelagos-shim-wasm "$pkgdir/usr/bin/pelagos-shim-wasm"
    install -Dm755 target/release/pelagos-shim-wasm "$pkgdir/usr/bin/containerd-shim-pelagos-wasm-v1"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Post-install setup script (run via .install)
    install -Dm755 scripts/setup.sh "$pkgdir/usr/share/$pkgname/setup.sh"

    # systemd-tmpfiles: ensure /run/pelagos exists with correct permissions on boot
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf" <<EOF
d /run/pelagos 0755 root root -
EOF
}
