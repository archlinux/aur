# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname="llm"
pkgname="${_pkgname}-git"
pkgver=r515.774d4c0
pkgrel=3
pkgdesc="Run inference for Large Language Models on CPU, with Rust 🦀🚀🦙"
arch=(any)
url="https://github.com/rustformers/${_pkgname}"
license=('MIT' 'APACHE')
depends=(glibc gcc-libs)
makedepends=(git cargo)
provides=(llm)
conflicts=(llm)
replaces=(llama-cli)
source=("git+${url}"
        "git+https://github.com/ggerganov/ggml"
        )
sha256sums=('SKIP' 'SKIP')


prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.crates/ggml/sys/ggml.url "${srcdir}/ggml"
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 target/release/llm -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
