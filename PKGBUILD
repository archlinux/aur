# Maintainer: AlexanderMattTurner <https://github.com/AlexanderMattTurner>
#
# AUR PKGBUILD for agent-glovebox. Lives here under version control; the published
# copy is mirrored into the AUR repo (ssh://aur@aur.archlinux.org/agent-glovebox.git)
# so Arch users can run:  yay -S agent-glovebox  (or any AUR helper / makepkg).
# The installed command is `glovebox`. See packaging/aur/README.md for how to cut
# a release and seed the AUR repo.
#
# makepkg provides srcdir/pkgdir and consumes the metadata vars, so shellcheck's
# "unused"/"unassigned" heuristics don't apply to a PKGBUILD.
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=agent-glovebox
pkgver=0.17.0
pkgrel=1
pkgdesc="Hardware-isolated, allowlist-firewalled sandbox for running Claude Code"
arch=('any')
url="https://github.com/AlexanderMattTurner/agent-glovebox"
license=('Apache-2.0')

# `claude-guard` is this project's former package name. replaces+conflicts make
# pacman migrate an existing `claude-guard` install to agent-glovebox on the next
# `-Syu` (both fields are needed: replaces drives the swap, conflicts blocks a
# co-install of the two names).
replaces=('claude-guard')
conflicts=('claude-guard')

# bash 5: the wrapper needs associative arrays + ${var,,}. git drives the
# worktree/snapshot flow; jq parses the firewall allowlist; coreutils backs the
# install scripts.
depends=('bash>=5' 'git' 'jq' 'coreutils')

# The container runtime is NOT a hard dep: `glovebox setup` provisions it
# when missing (the same path the git-clone install uses), so the package stays
# installable on a host that supplies it another way. nodejs/npm back pnpm and
# the in-image install. sbx backs the Docker microVM backend and is not
# provisioned by setup — it is a pure hint so a user knows what to install
# (docs.docker.com/ai/sandboxes).
optdepends=(
  'docker: container runtime (else provisioned by glovebox setup)'
  'nodejs: runtime backing pnpm and the in-image install'
  'npm: package manager backing the in-image install'
  'sbx: Docker microVM backend; install per docs.docker.com/ai/sandboxes and run "sbx login" once'
)

install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9dd6a15e3d93c6b494b27297d7c9e9a8ec2f9b6a55cf45db3461ab6db8ec5a67')

# Owner this release was cut from. Synced from config/packaging.json by
# scripts/gen-packaging.mjs (shared with the Homebrew formula and nFPM manifest)
# — edit it there, not here.
RELEASE_OWNER="AlexanderMattTurner"

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  local libdir="$pkgdir/usr/lib/$pkgname"

  # The launcher builds the sandbox image locally and resolves its sandbox-policy
  # stack relative to bin/, so the whole tree ships together under libdir. Drop
  # only dev/CI artifacts the runtime never reads; the launcher reads bin/,
  # sandbox-policy/, and .claude/ at runtime. The prune list and RELEASE_OWNER
  # below are synced from config/packaging.json by scripts/gen-packaging.mjs
  # (shared with the Homebrew formula and nFPM manifest) — edit them there.
  local prune=(tests research metrics .git .github node_modules .venv uv.lock)
  rm -rf -- "${prune[@]}"

  install -d "$libdir"
  cp -a . "$libdir/"

  # Only the two entry points go on PATH; `glovebox` dispatches to its
  # glovebox-* siblings from within libdir/bin.
  install -d "$pkgdir/usr/bin"
  local wrapper
  for wrapper in glovebox claude-github-app; do
    ln -s "/usr/lib/$pkgname/bin/$wrapper" "$pkgdir/usr/bin/$wrapper"
  done
  # The package is named agent-glovebox; expose that name as a command alias too.
  ln -s "/usr/lib/$pkgname/bin/glovebox" "$pkgdir/usr/bin/agent-glovebox"

  install -Dm644 completions/glovebox.bash \
    "$pkgdir/usr/share/bash-completion/completions/glovebox"
  install -Dm644 completions/glovebox.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_glovebox"
  install -Dm644 completions/glovebox.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/glovebox.fish"
  # bash-completion and fish autoload a completion file by the command name being
  # completed, so each alias (`claude`, `agent-glovebox`) needs its own entry or
  # tab-completing it loads nothing (the scripts self-guard, registering `claude`
  # only when it resolves to the wrapper). zsh needs no twin: its `#compdef
  # glovebox agent-glovebox claude` tags all three names in one file.
  ln -s glovebox "$pkgdir/usr/share/bash-completion/completions/claude"
  ln -s glovebox.fish "$pkgdir/usr/share/fish/vendor_completions.d/claude.fish"
  ln -s glovebox "$pkgdir/usr/share/bash-completion/completions/agent-glovebox"
  ln -s glovebox.fish "$pkgdir/usr/share/fish/vendor_completions.d/agent-glovebox.fish"
  install -Dm644 man/glovebox.1 "$pkgdir/usr/share/man/man1/glovebox.1"
}
