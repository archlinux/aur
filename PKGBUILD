# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=rosie
pkgver=0.6.1
pkgrel=1
pkgdesc="A robot helper for agent skills"
arch=('x86_64' 'aarch64')
url="https://github.com/matthewp/rosie"
license=('BSD-3-Clause')
# The Rust binary statically links rustls; no system curl/libarchive needed.
# binutils provides the GNU bfd linker — see build() for why we need it.
makedepends=('rust' 'cargo' 'binutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matthewp/rosie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b6b022cbf814c0e6f87c27c262dadf604564e0bdc7c5dca596555b866f7c683')

build() {
    cd "$pkgname-$pkgver"
    # Force GNU bfd linker. Arch's rust ships rust-lld as default, but
    # rust-lld 19/20 sometimes fails to resolve ring's C/asm-built symbols
    # (ring_core_0_17_14__*) at link time. bfd handles this correctly.
    export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=bfd"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/rosie "$pkgdir/usr/bin/rosie"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
