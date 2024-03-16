# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy-git
_pkgname="${pkgname/-git}"
pkgver=2024.4.r0.g8378f04
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=('x86_64')
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('git' 'cargo')
checkdepends=('cargo')
provides=('halloy')
conflicts=('halloy')
source=("git+${url}")
sha256sums=('SKIP')

prepare() {
    cd "${_pkgname}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${_pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen --release
}

package() {
    cd "${_pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${__pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${__pkgname}/LICENSE"

    install -Dm644 "assets/linux/org.squidowl.${_pkgname}.appdata.xml" -t "${pkgdir}/usr/share/appdata/metainfo"
    install -Dm644 "assets/linux/org.squidowl.${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "assets/linux/icons" "${pkgdir}/usr/share/"
}
