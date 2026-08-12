# Maintainer: James Brink <dev.urandom.io@gmail.com>
# Contributor: <add yourself when you start helping out>

pkgname=claudex
pkgver=0.13.1
pkgrel=1
pkgdesc="Query, search, and analyze Claude Code sessions from the command line (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/utensils/claudex"
license=('MIT')

depends=()

optdepends=(
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

# MSRV from Cargo.toml. Bump in lockstep with `rust-version` there.
makedepends=(
  'rust>=1.95'
  'cargo'
)

provides=("${pkgname}=${pkgver}")
conflicts=('claudex-bin' 'claudex-git')

# debuginfo + LTO would force a full reconfigure of the workspace.
# We let cargo's release profile (set in upstream Cargo.toml) decide.
options=(!lto)

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1e5a7443ecc2024306056c192f0da9d3876e46fc1196c215eeea219acb81e45')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Stage cargo's package cache under $srcdir so makepkg's cleanup
  # of $startdir doesn't leave noise in ~/.cargo.
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  # --frozen pairs with the `cargo fetch --locked` above: refuses
  # to touch the network during build, so a stale Cargo.lock fails
  # loudly instead of silently re-resolving.
  cargo build --release --frozen -p claudex-cli --bin claudex
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # clap_complete dynamic codegen bakes argv[0] into the script —
  # invoke via PATH so the completion references the bare name
  # `claudex` instead of an absolute $pkgdir path. See claudex-bin
  # PKGBUILD for the full explanation.
  install -d \
    "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  PATH="${pkgdir}/usr/bin:${PATH}" ${pkgname} completions bash \
    > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${pkgname} completions zsh \
    > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${pkgname} completions fish \
    > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
