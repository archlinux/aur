# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=rosie
pkgver=0.8.5
pkgrel=1
pkgdesc="A robot helper for agent skills"
arch=('x86_64' 'aarch64')
url="https://github.com/withastro/rosie"
license=('BSD-3-Clause')
# The Rust binary statically links rustls; no system curl/libarchive needed.
makedepends=('rust' 'cargo')
# !lto: makepkg's default -flto=auto in CFLAGS makes the cc crate compile
# ring's C/asm sources to LTO bitcode (GIMPLE). The Rust-driven final link
# doesn't run gcc's LTO front-end on them, so every ring_core_0_17_14__*
# symbol comes back undefined. Opting out of LTO restores native ELF objects.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/withastro/rosie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7c3944d90f75e66530742a5132c44dfb296b704541dc465d82e71439584776e')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/rosie "$pkgdir/usr/bin/rosie"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
