# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname="llm"
_feature="clblast"
pkgname="${_pkgname}-${_feature}-git"
pkgver=0.1.1.r592.g9376078
pkgrel=1
pkgdesc="An ecosystem of Rust libraries for working with large language models (with CLBlast)"
arch=(any)
url="https://github.com/rustformers/${_pkgname}"
license=('Apache-2.0 OR MIT')
depends=(glibc gcc-libs "$_feature")
makedepends=(git cargo)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=(llama-cli)
source=("git+${url}"
        "git+https://github.com/ggerganov/llama.cpp"
        )
sha256sums=('SKIP' 'SKIP')
options+=('!lto')


prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.crates/ggml/sys/llama-cpp.url "${srcdir}/llama.cpp"
    git -c protocol.file.allow=always submodule update

    cat LICENSE-* > LICENSE

    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features="${_feature}"
}

check () {
    cd "${srcdir}/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
