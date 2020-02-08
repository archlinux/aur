# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=cargo-c
pkgver=0.5.2
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries'
arch=('x86_64')
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
_commit='c232ef514f56c9d3fc3879df88ed15a76ce9534c'
source=("git+https://github.com/lu-zero/cargo-c.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    # https://github.com/lu-zero/cargo-c/issues/44
    # cannot use the '--locked' option as upstream does not provide 'Cargo.lock' (no reproducible builds support)
    cargo fetch --manifest-path cargo-c/Cargo.toml
}

build() {
    cargo build --release --frozen --manifest-path cargo-c/Cargo.toml
}

check() {
    cargo test --release --frozen --manifest-path cargo-c/Cargo.toml
}

package() {
    install -D -m755 cargo-c/target/release/cargo-cbuild   -t "${pkgdir}/usr/bin"
    install -D -m755 cargo-c/target/release/cargo-cinstall -t "${pkgdir}/usr/bin"
    install -D -m644 cargo-c/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
