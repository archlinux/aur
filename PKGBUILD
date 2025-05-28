# Maintainer: mokurin000 <mokurin000@gmail.com>

pkgname=(fitgirl-ddl-git fitgirl-ddl-gui-git)
pkgdesc="fitgirl-repacks.site extractor"
_pkgname=fitgirl-ddl
pkgver=r25.g42343f1
pkgrel=2
url="https://github.com/mokurin000/fitgirl-ddl"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    'gcc-libs' 'curl'
)
makedepends=(
    'rust' 'git' 'qt6-base' 'clang'
)

source=("git+${url}.git")

sha256sums=('SKIP')

# fix building _gui variant
options=(!lto)

prepare() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target ${CARCH}-unknown-linux-gnu
}

pkgver() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package_fitgirl-ddl-git() {
    conflicts=('fitgirl-ddl')
    provides=('fitgirl-ddl')

    cd "${_pkgname}"

    install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}


package_fitgirl-ddl-gui-git() {
    conflicts=('fitgirl-ddl-gui')
    provides=('fitgirl-ddl-gui')
    pkgdesc+=" (GUI version)"
    depends+=('qt6-base')

    cd "${_pkgname}"

    install -vDm755 "target/release/${_pkgname}_gui" -t "${pkgdir}/usr/bin/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}_gui"
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    export RUSTFLAGS="-C link-args=-flto"
    cargo build --frozen --release --bin ${_pkgname}
    cargo build --frozen --release --bin ${_pkgname}_gui --no-default-features -F qt
}
