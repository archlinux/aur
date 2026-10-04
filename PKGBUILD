# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf
_reponame=TermPDF
_executable=termpdf
pkgver=0.5.0
pkgrel=0
pkgdesc="A terminal PDF viewer written in Rust, with vim key-bindings and watch mode."
arch=('x86_64' 'aarch64')
url="https://www.github.com/NiJingzhe/${_reponame}"
license=('MIT')
depends=('libpdfium')
makedepends=('git' 'cargo')
conflicts=('tpdf-git' 'tpdf-bin')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('d9809722564688b56cd61cd3d17a6f28a88d571ad323b352a9d3a60112a36d26')

prepare() {
    cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/.*host: //p')"
}

build() {
	cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    TERMPDF_PDFIUM_VARIANT=SYSTEM cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    TERMPDF_PDFIUM_VARIANT=SYSTEM cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/${_reponame}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
