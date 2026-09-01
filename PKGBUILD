# Maintainer: Gino O. <aur@1337.io>
# Upstream canonical: https://git.iris.to/#/npub1xdhnr9mrv47kkrn95k6cwecearydeh8e895990n3acntwvmgk2dsdeeycm/nostr-vpn
# GitHub below is the upstream-maintained mirror used for clickable links and source clones.
pkgname=nostr-vpn-cli-git
_pkgname=nostr-vpn
_binname=nvpn
pkgver=4.1.9.r1.g7926f28
pkgrel=1
pkgdesc='nvpn CLI/daemon for Nostr VPN, a Tailscale-style private mesh VPN (git master)'
arch=('x86_64' 'aarch64')
url='https://github.com/mmalmi/nostr-vpn'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'rust' 'cargo')
provides=("nvpn=${pkgver%%.r*}" "nostr-vpn-cli=${pkgver%%.r*}")
conflicts=('nvpn' 'nostr-vpn-cli' 'nostr-vpn-cli-bin')
options=('!lto')
source=("${_pkgname}::git+https://github.com/mmalmi/nostr-vpn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen --bin "${_binname}" -p "${_binname}"
}

package() {
  install -Dm755 "${srcdir}/target/release/${_binname}" \
    "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
