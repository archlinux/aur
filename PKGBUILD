# Maintainer: Aaron Bockelie <aaronsb@gmail.com>

pkgname=ya-claude-code
pkgver=2.1.263
pkgrel=1
pkgdesc="Claude Code CLI, verified at build time against Anthropic's signed release manifest"
arch=('x86_64')
url="https://github.com/anthropics/claude-code"
license=('LicenseRef-claude-code')
depends=('bash' 'glibc')

# Same key that signs the Claude Desktop apt repository — one Anthropic release
# signing identity covers both products.
_fpr='31DDDE24DDFAB679F42D7BD2BAA929FF1A7ECACE'
_rel="https://downloads.claude.ai/claude-code-releases/${pkgver}"

optdepends=('git: let Claude use git'
            'github-cli: GitHub integration'
            'glab: GitLab integration'
            'ripgrep: faster file search'
            'tmux: agent team split panes'
            'bubblewrap: sandboxing'
            'socat: sandboxing')

provides=('claude-code')
conflicts=('claude-code')

# Self-contained Bun executable with an embedded runtime and resources;
# stripping corrupts it.
options=('!strip' '!debug')

source=("claude-${pkgver}::${_rel}/linux-x64/claude"
        "manifest-${pkgver}.json::${_rel}/manifest.json"
        "manifest-${pkgver}.json.pgpsig::${_rel}/manifest.json.sig"
        "legal-${pkgver}.md::https://code.claude.com/docs/en/legal-and-compliance.md"
        'anthropic-release-signing.key')

# The manifest and its detached signature authenticate each other, and the legal
# text is prose that upstream edits in place; none of the three can carry a fixed
# hash. The binary's hash is pinned and additionally re-derived from the signed
# manifest in prepare().
sha256sums=('26d020351e8112f4006790f3cfce43b4c9df0c1bb1d0e542364d64151b81d5ba'
            'SKIP'
            'SKIP'
            'SKIP'
            'bd70a5e4a268002704024ceba7f8446024114e94f3f0bdd11c23a9e592be81c6')

prepare() {
  cd "$srcdir"

  local keyring="$srcdir/.gnupg"
  rm -rf "$keyring"
  install -dm700 "$keyring"
  gpg --homedir "$keyring" --batch --quiet --import anthropic-release-signing.key

  local got
  got=$(gpg --homedir "$keyring" --batch --with-colons --fingerprint \
        | awk -F: '/^fpr:/{print $10; exit}')
  if [[ $got != "$_fpr" ]]; then
    echo "==> signing key is not Anthropic's: $got" >&2
    return 1
  fi

  gpg --homedir "$keyring" --batch --verify \
      "manifest-${pkgver}.json.pgpsig" "manifest-${pkgver}.json" >/dev/null 2>&1 || {
    echo "==> release manifest signature did not verify" >&2
    return 1
  }

  # The signed manifest carries the version alongside the checksums, so a
  # manifest for some other release cannot be substituted for this one.
  local mver
  mver=$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' \
         "manifest-${pkgver}.json" | head -1)
  if [[ $mver != "$pkgver" ]]; then
    echo "==> signed manifest is for ${mver:-nothing}, not ${pkgver}" >&2
    return 1
  fi

  local signed
  signed=$(sed -n '/"linux-x64"[[:space:]]*:/,/}/p' "manifest-${pkgver}.json" \
           | sed -n 's/.*"checksum"[[:space:]]*:[[:space:]]*"\([0-9a-f]\{64\}\)".*/\1/p' | head -1)
  if [[ $signed != "${sha256sums[0]}" ]]; then
    echo "==> linux-x64 checksum in the signed manifest (${signed:-none}) != pinned ${sha256sums[0]}" >&2
    return 1
  fi

  echo "==> verified claude ${pkgver} against Anthropic's signed release manifest"
}

package() {
  cd "$srcdir"

  install -Dm755 "claude-${pkgver}" "$pkgdir/opt/${pkgname}/bin/claude"

  # The binary self-updates and expects the native-installer layout under
  # ~/.local/bin. Both are wrong for a packaged install: an in-place update
  # would replace pacman-owned files, and the layout check warns on every
  # start. The wrapper turns off each.
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/claude" <<EOF
#!/bin/sh
export DISABLE_UPDATES=1
export DISABLE_INSTALLATION_CHECKS=1
exec /opt/${pkgname}/bin/claude "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/claude"

  install -Dm644 "legal-${pkgver}.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
