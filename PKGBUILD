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
pkgver=0.100.1
pkgrel=1
pkgdesc="Hardware-isolated, allowlist-firewalled sandbox for running Claude Code"
arch=('any')
url="https://github.com/AlexanderMattTurner/agent-glovebox"
license=('Apache-2.0')

# bash 5: the wrapper needs associative arrays + ${var,,}. git drives the
# worktree/snapshot flow; jq parses the firewall allowlist; coreutils backs the
# install scripts; python runs the doctor, audit and trace subcommands.
depends=('bash>=5' 'git' 'jq' 'coreutils' 'python')

# Docker is NOT a hard dep: a launch reaches it only when glovebox has to build
# the sandbox image locally, because no signed image is published for the tree.
# nodejs/npm back pnpm and the in-image install.
optdepends=(
  'docker: builds the sandbox image locally when no signed image is published'
  'docker-buildx: the build plugin that local sandbox image build runs through'
  'nodejs: runtime backing pnpm and the in-image install'
  'npm: package manager backing the in-image install'
)

install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexanderMattTurner/agent-glovebox/releases/download/v0.100.1/agent-glovebox-0.100.1.tar.gz")
sha256sums=('3af0beef9341758e73ae9538a1dd58e6fcb25f2801eaab270e7f8d38d7f78400')

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  local libdir="$pkgdir/usr/lib/$pkgname"

  # The launcher pulls the signed sandbox image that guest-image-inputs.json
  # names and resolves its sandbox-policy stack relative to bin/, so the whole tree ships together under libdir. Drop
  # only dev/CI artifacts the runtime never reads; the launcher reads bin/,
  # sandbox-policy/, and .claude/ at runtime. The prune list below is synced from
  # config/packaging.json — edit it there.
  local prune=('tests' 'research' 'metrics' '.git' '.github' 'node_modules' '.venv' 'evals' 'inspect-glovebox' 'exploitbench-glovebox' 'perflib' 'config/kata/seccomp/derive' 'tools' 'bin/checks' 'bin/_perf_path.py' 'bin/persist-perf-history.sh' 'bin/lib/model_selection.py' 'bin/lib/retry-github.bash' 'bin/lib/vm/live-claude.bash' 'scripts/prove-comment-edit-identity.py' 'bin/check-*' 'bin/bench-*' 'bin/refresh-models.py' 'config/bash-coverage-baseline.json' 'config/breakout-ctf-rounds.json' 'config/breakout-ctf-round-set.json' 'config/ci-family-inputs.json' 'config/ci-spend.json' 'config/ci-truth-serum-version' 'config/claude-budget.json' 'config/cts-tier-wide-skips.yaml' 'config/fast-checks.json' 'config/generated-consumer-waivers.json' 'config/js-coverage-baseline.json' 'config/launch-weakeners' 'config/landing-consent.json' 'config/lint-scope.json' 'config/loc-growth-budget.json' 'config/merge-queue-mode.json' 'config/metric-series.json' 'config/pin-advisory-waivers.json' 'config/pinned-tools.json' 'config/py-coverage-baseline.json' 'config/reachability-waivers.json' 'config/render-only-modules.json' 'config/review-severities.json' 'config/status-badges.json' 'config/syft-version.json' 'config/tool-pins' '.bestpractices.json' '.c8rc.json' '.claude/README.md' '.claude/agents' '.claude/commands' '.claude/rules' '.claude/skills' '.gitattributes' '.gitignore' '.gitleaks.toml' '.gitleaksignore' '.grype.yaml' '.hadolint.yaml' '.hooks' '.markdownlint-cli2.jsonc' '.pre-commit-config.yaml' '.prettierignore' '.prettierrc.json' '.shellcheckrc' '.template-version' 'AGENTS.md' 'CLAUDE.md' 'CONTRIBUTING.md' 'GOVERNANCE.md' 'ROADMAP.md' 'UNDERSTANDING.md' 'changelog.d' 'check-globs.mjs' 'conftest.py' 'docs/tla' 'eslint.config.js' 'flake.lock' 'flake.nix' 'knip.json' 'osv-scanner.toml' 'packaging/aur/PKGBUILD' 'packaging/aur/agent-glovebox.install' 'packaging/homebrew/agent-glovebox.rb' 'packaging/homebrew/tap_migrations.json' 'packaging/lib' 'packaging/nfpm/.gitignore' 'packaging/nfpm/nfpm.yaml' 'packaging/nfpm/postinstall.sh' 'packaging/nix/*.nix' 'packaging/nix/complete_pnpm_store.py' 'pyrightconfig-*.json' 'stryker.conf.json' 'stryker.scripts.conf.json' 'types' 'config/bash-mutation-scope.json' 'config/changelog-paths.json' 'config/diagram-meta.json' 'config/docs-site.json' 'config/lychee-internal.toml' 'config/lychee-published.toml' 'config/mutation-sessions.json' 'glovebox-driver/update-pin.sh' 'scripts/*.test.mjs' 'scripts/background-*' 'scripts/changelog-*' 'scripts/gen-*.py' 'scripts/gen_*' 'scripts/generate-*' 'scripts/generator*' 'scripts/lib_background_*' 'scripts/run-*' 'scripts/stryker-*' 'scripts/write-*' 'scripts/gen-bash-grammar.mjs' 'scripts/gen-cli-docs.mjs' 'scripts/gen-control-plane-schema.mjs' 'scripts/gen-hook-settings.mjs' 'scripts/gen-launch-marks.mjs' 'scripts/gen-launch-phases.mjs' 'scripts/gen-launch-weakeners.mjs' 'scripts/gen-mutation-configs.mjs' 'scripts/gen-packaging.mjs' 'scripts/gen-regen-owned.mjs' 'scripts/gen-status-badges.mjs' 'scripts/gen-tool-configs.mjs' 'scripts/gen-trace-doc.mjs' 'scripts/gen-trace-events.mjs' 'scripts/gen-unpinnable-hooks.mjs' 'scripts/gen-vm-setup-protocol.mjs' 'scripts/gen-write-tool-spellings.mjs' 'scripts/actionlint-run.sh' 'scripts/brew-audit.sh' 'scripts/build-redactor-vendor.py' 'scripts/cli-spec-flags.mjs' 'scripts/cli-spec.mjs' 'scripts/codex-setup.sh' 'scripts/dev-setup.sh' 'scripts/gitleaks-staged.sh' 'scripts/go-checks.sh' 'scripts/kata-mac-validate.sh' 'scripts/launch-legs.py' 'scripts/launch-metric.py' 'scripts/lib-background-run.sh' 'scripts/lib-fork-point.mjs' 'scripts/lib-generator-command.mjs' 'scripts/lib-hand-resolved-outputs.mjs' 'scripts/lib-lint-scope.mjs' 'scripts/lib-lock-merge.mjs' 'scripts/lib-pinned-version.mjs' 'scripts/lib-regen-hook-inputs.mjs' 'scripts/lib-regen-rules.mjs' 'scripts/lib-repo-python.mjs' 'scripts/lib_diagram_meta.py' 'scripts/postinstall.mjs' 'scripts/push-when-damper-lifts.sh' 'scripts/read-eval-scores-impl.py' 'scripts/read-eval-scores.py' 'scripts/reap-session-worktrees.py' 'scripts/relock-python-requirements.sh' 'scripts/render-doc-site.py' 'scripts/resolve-generated.mjs' 'scripts/serial-nudge-replay.mjs' 'scripts/shellcheck-cache.sh' 'scripts/shellharden-run.sh' 'scripts/shfmt-staged.sh' 'scripts/test-slot.sh' 'scripts/vm_managed_baseline.py')
  local pattern
  local -a matches
  for pattern in "${prune[@]}"; do
    # An entry may be a glob, and it must expand HERE, in the extracted tree.
    # `compgen -G` expands a QUOTED pattern against the current directory and
    # prints what it matched, so the expansion needs no unquoted word. It exits
    # 1 when nothing matches, which is a pattern naming a path this tree does
    # not carry.
    matches=()
    mapfile -t matches < <(compgen -G "$pattern" || true)
    if [[ ${#matches[@]} -gt 0 ]]; then
      rm -rf -- "${matches[@]}"
    fi
  done

  install -d "$libdir"
  cp -a . "$libdir/"

  # Only setup.bash's wrappers go on PATH; `glovebox` dispatches to its
  # bin/subcommands/ scripts and glovebox-github-app/cli.mjs from within libdir.
  install -d "$pkgdir/usr/bin"
  local wrapper
  # shellcheck disable=SC2043 # gen-packaging writes setup.bash's wrapper list here, one name today
  for wrapper in glovebox; do
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
  # completed, so the `agent-glovebox` alias needs its own entry or tab-completing
  # it loads nothing. zsh needs no twin: its `#compdef glovebox agent-glovebox`
  # header tags both. `claude` gets none either — this package puts no `claude` on
  # PATH, so a twin would complete the user's own Claude Code with glovebox's flags.
  ln -s glovebox "$pkgdir/usr/share/bash-completion/completions/agent-glovebox"
  ln -s glovebox.fish "$pkgdir/usr/share/fish/vendor_completions.d/agent-glovebox.fish"
  install -Dm644 man/glovebox.1 "$pkgdir/usr/share/man/man1/glovebox.1"
}
