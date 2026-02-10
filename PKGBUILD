# Maintainer: Kitotsu Molina <kitotsu@users.noreply.github.com>

pkgname=kitsune-kitowall
_pkgname=kitsune
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Visualizador de audio para Hyprland/Wayland (Rust + CAVA + mpvpaper/layer-shell)'
arch=('x86_64')
url='https://github.com/KitotsuMolina/kitsune'
license=('MIT')
depends=('bash' 'cava' 'mpv' 'mpvpaper')
makedepends=('git' 'cargo' 'rust')
provides=('kitsune')
conflicts=('kitsune')
install='kitsune.install'
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver
  ver="$(grep '^version' Cargo.toml | head -n1 | cut -d '"' -f2)"
  printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked --bins
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/share/${_pkgname}"

  cp -a scripts "${pkgdir}/usr/share/${_pkgname}/"
  cp -a config "${pkgdir}/usr/share/${_pkgname}/"
  cp -a completions "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 README.md "${pkgdir}/usr/share/${_pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 docs/ARCHITECTURE.md "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"
  install -Dm644 docs/COMMANDS.md "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"

  install -d "${pkgdir}/usr/share/${_pkgname}/bin"
  install -Dm755 target/release/kitsune "${pkgdir}/usr/share/${_pkgname}/bin/kitsune"
  install -Dm755 target/release/kitsune-layer "${pkgdir}/usr/share/${_pkgname}/bin/kitsune-layer"

  # Use packaged binaries instead of compiling on every start.
  sed -i \
    -e '/^echo "\[i\] Building Rust renderer\.\.\."$/d' \
    -e '/^cargo build --release --locked --bins$/d' \
    -e '/^cargo build --release --bins$/d' \
    -e 's|\./target/release/kitsune-layer|"${KITSUNE_BIN_DIR:-./bin}"/kitsune-layer|g' \
    -e 's|\./target/release/kitsune|"${KITSUNE_BIN_DIR:-./bin}"/kitsune|g' \
    "${pkgdir}/usr/share/${_pkgname}/scripts/start.sh" \
    "${pkgdir}/usr/share/${_pkgname}/scripts/kitsune.sh"

  # Global entrypoint: bootstrap a writable user workspace on first run.
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/kitsune" <<'WRAP'
#!/usr/bin/env bash
set -euo pipefail

system_home='/usr/share/kitsune'
user_home="${XDG_DATA_HOME:-$HOME/.local/share}/kitsune"

if [[ ! -d "$user_home" ]]; then
  mkdir -p "$(dirname "$user_home")"
  cp -a "$system_home" "$user_home"
  chmod -R u+rwX "$user_home"
fi

exec "$user_home/scripts/kitsune.sh" "$@"
WRAP
  chmod 755 "${pkgdir}/usr/bin/kitsune"

  # Shell completions
  install -Dm644 completions/kitsune.bash "${pkgdir}/usr/share/bash-completion/completions/kitsune"
  install -Dm644 completions/_kitsune "${pkgdir}/usr/share/zsh/site-functions/_kitsune"
  install -Dm644 completions/kitsune.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kitsune.fish"
}
