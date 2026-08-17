# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=dewey
pkgver=0.2.0
pkgrel=1
pkgdesc="Command-line framework for open ebook libraries"
arch=('x86_64' 'aarch64')
url="https://github.com/tedwardd/dewey"
license=('MIT')
makedepends=('cargo' 'python')
provides=('dewey')
conflicts=('dewey-bin')
install=dewey.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tedwardd/dewey/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cdd6ddfb1f8d0674a6bcb278ca0bc22394d5863f9d42135e13068c018eb58616')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    # Arch's makepkg injects CFLAGS/LDFLAGS (-flto, -g, -ffile-prefix-map,
    # pack-relative-relocs) plus merged DEBUG_RUSTFLAGS (-C debuginfo,
    # --remap-path-prefix); the combination breaks linking ring's assembly
    # (undefined symbols like ring_core_0_17_14__LIMB_is_zero). Clean flags.
    unset CFLAGS CXXFLAGS LDFLAGS FFLAGS FCFLAGS CHOST RUSTFLAGS
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    unset CFLAGS CXXFLAGS LDFLAGS FFLAGS FCFLAGS CHOST RUSTFLAGS
    cargo test --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/dewey "${pkgdir}/usr/bin/dewey"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
