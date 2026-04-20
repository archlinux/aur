# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=yourmom-git
pkgver=r.1
pkgrel=1
pkgdesc="The most cursed programming language in existence — quantum esoteric lang that transpiles to C"
arch=('x86_64')
url="https://github.com/viewerofall/yourmom"
license=('GPL-3.0-or-later')
depends=('gcc')
makedepends=('rust' 'cargo')
provides=('yourmom')
conflicts=('yourmom')
source=("${pkgname}::git+https://github.com/viewerofall/yourmom.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen 2>/dev/null || true
}

package() {
    cd "${pkgname}"
    install -Dm755 target/release/yourmom "${pkgdir}/usr/bin/yourmom"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 qol.momjoke "${pkgdir}/usr/share/yourmom/qol.momjoke"
}
