# Maintainer: devome <evinedeng@hotmail.com>

_reponame="OpenViking"
_cmdname="ov"
pkgname="${_reponame,,}-cli"
pkgver=0.5.2
pkgrel=1
pkgdesc="Rust CLI client for OpenViking"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/volcengine/${_reponame}"
license=('AGPL-3.0-or-later')
conflicts=("${_cmdname}")
depends=("bzip2" "glibc" "libgcc" "xz")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/cli@${pkgver}.tar.gz")
sha256sums=('4d125436e1aa7047ec5e5f46cf241787b24d3a102684cfdfca1909182958b2f7')

prepare() {
    cd "${_reponame}-cli-${pkgver}"
    sed -i "s|version = \"0.0.0\"|version = \"${pkgver}\"|g" crates/ov_cli/Cargo.toml
    # cargo update
    cargo fetch --target "$(rustc --print host-tuple)" # --locked
}

build() {
    cd "${_reponame}-cli-${pkgver}"
    cargo build --release --frozen --all-features
}

# check() {
#     cd "${_reponame}-cli-${pkgver}"
#     cargo test --frozen --all-features --workspace
# }

package() {
    local _tgtbin="target/release/${_cmdname}"

    cd "${_reponame}-cli-${pkgver}"
    install -Dm755 "${_tgtbin}"  "${pkgdir}/usr/bin/${_cmdname}"
    install -Dm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    find docs -not -path "*/.vitepress" -not -path "*/.vitepress/*" \
        -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
