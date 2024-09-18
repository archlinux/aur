# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=uiua
pkgbase=uiua-git
pkgname=(uiua-git uiua-docs-git)
pkgver=0.13.0.dev.1.r187.g0cb738fc
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://www.uiua.org/"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('binaryen' 'cargo' 'git' 'rust-wasm' 'trunk' 'wasm-bindgen')
provides=("uiua=${pkgver}")
conflicts=('uiua')
_commit='0cb738fcbd44b33481fab84cc2fbe8a2c2fc44dd'
source=("${_pkgname}::git+https://github.com/uiua-lang/uiua#commit=${_commit}")
md5sums=('SKIP')
options=(!lto)

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd $_pkgname
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    cargo build --frozen --release --all-features
    cd site
    trunk build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    cargo test --frozen --all-features
}

package_uiua-git() {
    cd $_pkgname
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" license
}

package_uiua-docs-git() {
    pkgdesc+=' (documentation)'

    cd $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" readme.md
    cp -r site/dist "${pkgdir}/usr/share/doc/${_pkgname}/site"
}
