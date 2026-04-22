# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf-git
_reponame=TermPDF
_executable=termpdf
pkgver=0.1.1.r0.g29e63cd
pkgrel=1
pkgdesc="A terminal PDF viewer written in Rust, with vim key-bindings and watch mode."
arch=('x86_64' 'aarch64')
url="https://www.github.com/NiJingzhe/${_reponame}"
license=('MIT')
depends=('libpdfium')
makedepends=('git' 'cargo')
checkdepends=('cargo')
provides=('tpdf')
conflicts=('tpdf' 'tpdf-bin')
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_reponame}"
    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
