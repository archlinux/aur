# Maintainer: James Brink <dev.urandom.io@gmail.com>
# Contributor: <add yourself when you start helping out>

pkgname=claudette
pkgver=0.24.0
pkgrel=1
pkgdesc="Desktop orchestrator for parallel Claude Code agents (Tauri 2 + React) — built from source"
arch=('x86_64' 'aarch64')
url="https://github.com/utensils/Claudette"
license=('MIT')

# Hard runtime deps match the `claudette-bin` set — same payload,
# same dependency surface. Keep this list aligned with that PKGBUILD.
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
  'rust>=1.94'    # workspace pins 1.94 via mise.toml
  'cargo'
  'bun'           # extra/bun ships frontend tooling (Vite + tsc)
  'pkgconf'
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'alsa-lib'
  'openssl'
  'patchelf'      # tauri-bundler uses patchelf for the .deb payload
  'git'
)

provides=("${pkgname}=${pkgver}" "claudette-cli=${pkgver}")
conflicts=('claudette-bin' 'claudette-git' 'claudette-cli')

# Tauri produces a fully-formed .deb — re-extracting and re-stripping
# would just discard the work it already did.
options=(!strip !debug !lto)

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e52f832458b668e1f84714caa32878b2d626352d20cbe4073173507f2e082f0b')

prepare() {
  cd "Claudette-${pkgver}"

  # Frontend deps — `--frozen-lockfile` matches CI; bun.lock is
  # checked in upstream so this resolves deterministically.
  cd src/ui
  bun install --frozen-lockfile
  cd ../..
}

build() {
  cd "Claudette-${pkgver}"

  # Pin tauri-cli locally so the build is reproducible against an
  # explicit Tauri version even if `cargo install`'s global cache
  # has something newer.
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo install \
    --locked \
    --root "${srcdir}/cargo-bin" \
    --version "^2" \
    tauri-cli
  export PATH="${srcdir}/cargo-bin/bin:${PATH}"

  # Stage the `claudette` CLI sidecar at the path Tauri's
  # `bundle.externalBin` expects — `target/<triple>/release/claudette`
  # then copied into `src-tauri/binaries/claudette-<triple>`.
  local target
  case "$CARCH" in
    x86_64)  target="x86_64-unknown-linux-gnu"  ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  scripts/stage-cli-sidecar.sh "${target}"

  # The Pi harness sidecar is a Bun-compiled TS executable. We drop
  # it on the source build path so AUR users don't need bun + a
  # second build step. The `tauri.no-pi.conf.json` overlay removes
  # the externalBin reference; `--no-default-features` drops the
  # Rust glue. Codex Native and the rest of `alternative-backends`
  # stay available.
  cargo tauri build \
    --target "${target}" \
    --bundles deb \
    --no-default-features \
    --features tauri/custom-protocol,server,voice,alternative-backends \
    -c src-tauri/tauri.no-pi.conf.json \
    --verbose
}

package() {
  cd "Claudette-${pkgver}"

  local target debfile
  case "$CARCH" in
    x86_64)  target="x86_64-unknown-linux-gnu"; debfile="Claudette_${pkgver}_amd64.deb"  ;;
    aarch64) target="aarch64-unknown-linux-gnu"; debfile="Claudette_${pkgver}_arm64.deb" ;;
  esac

  # The bundler writes the .deb here. Reuse the same extract pattern
  # as claudette-bin so the on-disk layout is identical regardless
  # of which AUR package the user installed.
  bsdtar -xf "target/${target}/release/bundle/deb/${debfile}" -C "${srcdir}"
  bsdtar -xpf "${srcdir}/data.tar."* -C "${pkgdir}/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
