# Maintainer: James Brink <dev.urandom.io@gmail.com>
# Contributor: <add yourself when you start helping out>

pkgname=claudette-git
_pkgname=claudette
pkgver=0.24.0.r0.g0000000
pkgrel=1
pkgdesc="Desktop orchestrator for parallel Claude Code agents (Tauri 2 + React) — built from main"
arch=('x86_64' 'aarch64')
url="https://github.com/utensils/Claudette"
license=('MIT')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'alsa-lib'
  'openssl'
  'git'
)

optdepends=(
  'claude-code: drive Claude Code sessions (the primary use case)'
  'xdg-desktop-portal-gtk: native file dialogs (GTK-based DEs: XFCE, MATE, Cinnamon)'
  'xdg-desktop-portal-gnome: native file dialogs (GNOME)'
  'xdg-desktop-portal-kde: native file dialogs (KDE Plasma)'
  'xdg-desktop-portal-hyprland: native file dialogs (Hyprland)'
  'github-cli: GitHub PR / issue / CI integration via scm-github plugin'
  'glab: GitLab PR / pipeline integration via scm-gitlab plugin'
  'direnv: per-workspace env activation via env-direnv plugin'
  'mise: per-workspace env activation via env-mise plugin'
  'nix: Nix devshell env activation via env-nix-devshell plugin'
  'openssh: remote workspaces over SSH transport'
)

makedepends=(
  'git'
  'rust>=1.94'
  'cargo'
  'bun'
  'pkgconf'
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'alsa-lib'
  'openssl'
  'patchelf'
)

provides=("${_pkgname}=${pkgver%.r*}" "claudette-cli=${pkgver%.r*}")
conflicts=("${_pkgname}" 'claudette-bin' 'claudette-cli')

options=(!strip !debug !lto)

# Single git source pinned to `main` so users always track upstream
# HEAD. The `claudette` checkout dir name comes from the URL fragment
# substitution `(... 'claudette::git+...')`.
source=("${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

# Arch convention for VCS pkgver:  <upstream-tag>.r<commits-since-tag>.g<short-sha>
# e.g. 0.24.0.r17.g3fa19b0c
pkgver() {
  cd "${_pkgname}"
  local tag
  tag="$(git describe --tags --abbrev=0 --match='v*' 2>/dev/null || echo 'v0.0.0')"
  printf '%s.r%s.g%s' \
    "${tag#v}" \
    "$(git rev-list --count "${tag}..HEAD")" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  cd src/ui
  bun install --frozen-lockfile
  cd ../..
}

build() {
  cd "${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo install \
    --locked \
    --root "${srcdir}/cargo-bin" \
    --version "^2" \
    tauri-cli
  export PATH="${srcdir}/cargo-bin/bin:${PATH}"

  local target
  case "$CARCH" in
    x86_64)  target="x86_64-unknown-linux-gnu"  ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac

  scripts/stage-cli-sidecar.sh "${target}"

  cargo tauri build \
    --target "${target}" \
    --bundles deb \
    --no-default-features \
    --features tauri/custom-protocol,server,voice,alternative-backends \
    -c src-tauri/tauri.no-pi.conf.json \
    --verbose
}

package() {
  cd "${_pkgname}"

  local target debfile
  case "$CARCH" in
    x86_64)  target="x86_64-unknown-linux-gnu"; debfile="Claudette_*_amd64.deb" ;;
    aarch64) target="aarch64-unknown-linux-gnu"; debfile="Claudette_*_arm64.deb" ;;
  esac

  # Glob the .deb filename — pkgver above is VCS-derived, but the
  # bundler stamps the .deb with the workspace Cargo.toml's version
  # field (`0.24.0` at this commit). Either resolves to one file in
  # the bundle dir.
  local deb
  deb="$(echo target/"${target}"/release/bundle/deb/${debfile})"
  bsdtar -xf "${deb}" -C "${srcdir}"
  bsdtar -xpf "${srcdir}/data.tar."* -C "${pkgdir}/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
