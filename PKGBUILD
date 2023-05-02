# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname="llm"
pkgname="${_pkgname}-git"
pkgver=r413.e97ae8d
pkgrel=1
epoch=
pkgdesc="Run inference for Large Language Models on CPU 🦀🚀🦙"
arch=(any)
url="https://github.com/rustformers/llm"
license=('MIT' 'APACHE')
groups=()
depends=(glibc gcc-libs)
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=(llm)
conflicts=()
replaces=(llama-cli)
backup=()
options=()
install=
changelog=
source=("git+https://github.com/rustformers/llm.git"
        "git+https://github.com/ggerganov/ggml.git")
noextract=()
sha256sums=('SKIP' 'SKIP')
validpgpkeys=()


prepare() {
    cd "${_pkgname}"
    git submodule init
    git config submodule.crates/ggml/sys/ggml.url "${srcdir}/ggml"
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cat LICENSE-* > LICENSE
    cargo build --release
}

package() {
    cd "${_pkgname}"
    install -Dm755 target/release/llm -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
