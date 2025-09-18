# Maintainer: Vince Liem <vincepaul.liem@gmail.com>

pkgname=oxidizr-arch
pkgver=0.1.1
pkgrel=1
pkgdesc="Arch CLI to safely switch coreutils/findutils/sudo to Rust replacements via Switchyard (dry-run by default)"
arch=('x86_64' 'aarch64')
url="https://github.com/veighnsche/oxidizr-arch"
license=('Apache' 'MIT')
depends=('bash' 'pacman')
makedepends=('rust' 'cargo' 'help2man')
optdepends=(
  'paru: AUR helper for installing AUR replacements (optional)'
  'sudo: Fallback for running AUR helper as non-root user'
  'libselinux: Enables SELinux detection via getenforce (optional)'
  'bash-completion: Bash completion'
  'zsh: Zsh completion'
  'fish: Fish completion'
)
provides=('oxidizr-arch')
conflicts=('oxidizr-arch-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/veighnsche/oxidizr-arch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f821d1a3302f237535f56324e9d10aa59fafef883ccd3856588999753009a410')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}" 2>/dev/null || cd "${srcdir}/${pkgname}-v${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" 2>/dev/null || cd "${srcdir}/${pkgname}-v${pkgver}"
  cargo build -p oxidizr-arch --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" 2>/dev/null || cd "${srcdir}/${pkgname}-v${pkgver}"
  install -Dm755 "target/release/oxidizr-arch" "${pkgdir}/usr/bin/oxidizr-arch"
  # Docs
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Shell completions
  mkdir -p "${srcdir}/completions"
  ./target/release/oxidizr-arch completions bash > "${srcdir}/completions/oxidizr-arch.bash"
  ./target/release/oxidizr-arch completions zsh  > "${srcdir}/completions/_oxidizr-arch"
  ./target/release/oxidizr-arch completions fish > "${srcdir}/completions/oxidizr-arch.fish"
  install -Dm644 "${srcdir}/completions/oxidizr-arch.bash" "${pkgdir}/usr/share/bash-completion/completions/oxidizr-arch"
  install -Dm644 "${srcdir}/completions/_oxidizr-arch"     "${pkgdir}/usr/share/zsh/site-functions/_oxidizr-arch"
  install -Dm644 "${srcdir}/completions/oxidizr-arch.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/oxidizr-arch.fish"

  # Man page via help2man
  help2man -N -n "Switch to Rust replacements for coreutils/findutils/sudo" \
    -o "${srcdir}/oxidizr-arch.1" "./target/release/oxidizr-arch" || true
  if [[ -f "${srcdir}/oxidizr-arch.1" ]]; then
    install -Dm644 "${srcdir}/oxidizr-arch.1" "${pkgdir}/usr/share/man/man1/oxidizr-arch.1"
  fi

  # Licenses (if present in release tarball)
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
  if [[ -f LICENSE-MIT ]]; then
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  fi
}
