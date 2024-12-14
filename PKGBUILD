# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Self Denial <selfdenial at pm dot me>
# Contributor: antermin <github dot com slash antermin>

pkgname=python-proton-vpn-local-agent
pkgver=1.2.0
pkgrel=2
_commit=9bdad2fa5fcb39bcdc521e1e5640c8706019f97c
pkgdesc="Proton VPN local agent written in Rust"
arch=('x86_64')
url="https://github.com/ProtonVPN/local-agent-rs"
license=("GPL3")
options=(!debug !lto)
groups=("ProtonVPN")
depends=('python')
makedepends=('git' 'cargo')
source=("git+https://github.com/ProtonVPN/local-agent-rs.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"/local-agent-rs/python-proton-vpn-local-agent
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}"/local-agent-rs/python-proton-vpn-local-agent
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}"/local-agent-rs/python-proton-vpn-local-agent
    cargo test --frozen --all-features
}

package() {
    mkdir -p "${pkgdir}"/usr/lib/python3.12/site-packages/proton/vpn
    install -Dm755 "${srcdir}"/local-agent-rs/python-proton-vpn-local-agent/target/release/libpython_proton_vpn_local_agent.so "${pkgdir}"/usr/lib/python3.12/site-packages/proton/vpn/local_agent.abi3.so
}
