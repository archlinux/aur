# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname="llm"
_feature="cublas"
pkgname="${_pkgname}-${_feature}-git"
pkgver=r929.fc1c052
pkgrel=1
pkgdesc="An ecosystem of Rust libraries for working with large language models (with CUBlas)"
arch=(any)
url="https://github.com/rustformers/${_pkgname}"
license=('MIT' 'APACHE')
depends=(glibc gcc-libs cuda)
makedepends=(git cargo)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=(llama-cli)
source=("git+${url}"
        "git+https://github.com/ggerganov/llama.cpp"
        )
sha256sums=('SKIP' 'SKIP')


prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.crates/ggml/sys/llama-cpp.url "${srcdir}/llama.cpp"
    git -c protocol.file.allow=always submodule update
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
    cat LICENSE-* > LICENSE
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo build --frozen --release "--features=${_feature}"
}

check () {
    cd "${srcdir}/${_pkgname}"
    RUSTUP_TOOLCHAIN=stable cargo test --frozen --all-features --workspace
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
