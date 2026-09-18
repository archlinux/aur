# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-git
pkgver=0.8.0.r0.g0000000
pkgrel=1
pkgdesc="High-performance Bitwarden CLI and resident daemon (Git develop branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/icyleaf/omarchy-bitwarden"
license=('MIT')
depends=('libsecret' 'wl-clipboard')
makedepends=('cargo' 'git')
optdepends=('libfido2: WebAuthn / Passkey / FIDO2 security key support')
provides=('omawarden' 'omawarden-bin')
conflicts=('omawarden' 'omawarden-bin')
options=('!lto')
source=("omarchy-bitwarden::git+https://github.com/icyleaf/omarchy-bitwarden.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/omarchy-bitwarden"
    _ver=$(grep -m1 '^version = ' omawarden/Cargo.toml | cut -d'"' -f2 | sed 's/-dev//')
    _rev=$(git rev-list --count HEAD)
    _hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.g%s" "$_ver" "$_rev" "$_hash"
}

prepare() {
    cd "${srcdir}/omarchy-bitwarden/omawarden"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/omarchy-bitwarden/omawarden"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --bin omawarden
}

package() {
    cd "${srcdir}/omarchy-bitwarden"
    install -Dm755 omawarden/target/release/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
