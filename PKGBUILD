# Maintainer: James Brink <dev.urandom.io@gmail.com>
# Contributor: <add yourself when you start helping out>

pkgname=claudette-bin
_pkgname=claudette
pkgver=0.24.0
pkgrel=1
pkgdesc="Desktop orchestrator for parallel Claude Code agents (Tauri 2 + React)"
arch=('x86_64' 'aarch64')
url="https://github.com/utensils/Claudette"
license=('MIT')

# Hard runtime deps mirror the .deb's Depends field (Tauri 2 stack
# on Linux) plus `git`, which every worktree / fork / snapshot
# operation shells out to via tokio::process::Command. The app
# launches without git but its defining feature fails immediately,
# so it belongs in the "broken without it" tier.
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

# `claude-code` is the primary use case but lives in optdepends
# because alt-backends (Codex Native, Pi, OpenAI, LM Studio, Ollama)
# are first-class agent runtimes — a user installing claudette-bin
# specifically to drive Codex shouldn't be forced to pull a Node-
# heavy claude-code tree. The upstream .deb makes the same call:
# the CLI is runtime-probed, not declared as a Depends. The AUR
# `claude-code` package (maint: cg505) tracks Anthropic's npm
# releases and is the right name to point users at.
optdepends=(
  'claude-code: drive Claude Code sessions (the primary use case)'
  # The Tauri dialog plugin panics from inside Rust on portal-less
  # Linux; without one of these backends, Claudette hides Browse
  # buttons and falls back to manual path entry. Most full DEs
  # pull in a matching backend transitively — install whichever
  # matches your desktop.
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

# `claudette-bin` and the from-source `claudette` are alternates: same
# binaries land at the same paths, so installing both makes no sense.
# `provides=('claudette')` lets AUR helpers treat them as substitutable.
# The bare-name `claudette` also covers the user-facing CLI binary the
# upstream .deb installs at /usr/bin/claudette.
provides=("${_pkgname}=${pkgver}" "claudette-cli=${pkgver}")
conflicts=("${_pkgname}" 'claudette-git' 'claudette-cli')

# Tauri's `.deb` is fully laid out (icons, .desktop, /usr/bin) and
# already debug-stripped + lintian-clean. Re-stripping or repacking
# loses nothing and risks invalidating the embedded sidecar signatures.
options=(!strip !debug !lto)

source_x86_64=("${url}/releases/download/v${pkgver}/Claudette_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Claudette_${pkgver}_arm64.deb")

# `sha256sums` are rewritten by `scripts/aur/update-pkgbuild.sh` on
# every release. `SKIP` is a placeholder for hand-applied dev work —
# CI should never push a PKGBUILD with SKIP in these fields.
sha256sums_x86_64=('d176881bdef98b13816e2e30960f0fcfea15c80a225bc22ae9ca241531223246')
sha256sums_aarch64=('63b254d8405419089dd22422c594e0b70f1a7b80c8c7d9150e08e263ede01355')

package() {
  # `bsdtar` (libarchive) reads .deb as a top-level ar archive,
  # extracting `data.tar.zst` (or .gz/.xz depending on dpkg-deb mode)
  # alongside `control.tar.*`. We then expand the data tarball into
  # $pkgdir/ — that is the entire payload (binaries, icons, .desktop).
  local debfile
  case "$CARCH" in
    x86_64)  debfile="Claudette_${pkgver}_amd64.deb"  ;;
    aarch64) debfile="Claudette_${pkgver}_arm64.deb"  ;;
  esac

  cd "${srcdir}"
  bsdtar -xf "${debfile}"
  bsdtar -xpf data.tar.* -C "${pkgdir}/"

  # Move the LICENSE Tauri-bundler dropped under /usr/share/doc into
  # the Arch-canonical location. Non-fatal if the file shape changes
  # upstream — the .deb installs at least one copyright file.
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  if [[ -f "${pkgdir}/usr/share/doc/${_pkgname}/copyright" ]]; then
    install -Dm644 \
      "${pkgdir}/usr/share/doc/${_pkgname}/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
