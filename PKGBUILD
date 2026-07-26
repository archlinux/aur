# Maintainer: Gino O. <aur@1337.io>
# Upstream canonical: https://git.iris.to/#/npub1xdhnr9mrv47kkrn95k6cwecearydeh8e895990n3acntwvmgk2dsdeeycm/nostr-vpn
# GitHub below is the upstream-maintained mirror used for clickable links and source clones.
pkgname=nostr-vpn-git
_pkgname=nostr-vpn
pkgver=4.1.4.r10.g63d90e8
pkgrel=1
pkgdesc='GTK4/libadwaita desktop client for Nostr VPN, a Tailscale-style private mesh VPN (git master)'
arch=('x86_64' 'aarch64')
url='https://github.com/mmalmi/nostr-vpn'
license=('MIT')
depends=(
  'gtk4'
  'libadwaita'
  'glib2'
  'cairo'
  'zbar'
  'curl'
  'xdg-utils'
  'nostr-vpn-cli'
)
makedepends=('git' 'rust' 'cargo' 'pkgconf' 'clang')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!lto')
source=("${_pkgname}::git+https://github.com/mmalmi/nostr-vpn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}/linux"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}/linux"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "${srcdir}/target/release/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "linux/resources/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  local size
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "linux/resources/${_pkgname}-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
