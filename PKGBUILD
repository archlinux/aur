# Maintainer: NightStars <nightstars@galaxistars.com>

pkgname=cursor-ai-bin
pkgver=3.4.13
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
depends=(xdg-utils ripgrep nodejs
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip !debug) # Don't break ext of VSCode
_commit=e8e175702dcdf6cb24df72c1e94133748d0c5e86
source=("https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${pkgver}_amd64.deb"
rg.sh)
sha512sums=('SKIP'
  'e79fe7659f59d1ae02fc68816399bfd31587315df6cdb6ccf1d0ca76f7cdc692c2a42b30591c0091147bd97ef14b1c7745dc26bd7cb3ea6bba45698e5044fa2a')
sha512sums[0]=d694a54cc2eac8f36e127137465b4c93fd6d5bc0a4fd20d78e65f25597ca4e33e1790013a2495e67081ff46dc02b1a9ed8dfa467c400964c0d07d9998cbb2413
noextract=(cursor_${pkgver}_amd64.deb) # avoid double tarball
_app=usr/share/cursor/resources/app
package() {
  # Keep upstream bundled runtime to avoid system-Electron mismatch issues.
  bsdtar -xOf ${noextract[0]} data.tar.xz | tar -xJf - -C "$pkgdir"
  cd "$pkgdir"
  if [[ -d usr/share/zsh/vendor-completions ]]; then
    install -d usr/share/zsh/site-functions
    cp -a usr/share/zsh/vendor-completions/. usr/share/zsh/site-functions/
    rm -rf usr/share/zsh/vendor-completions
  fi
  ln -sf /usr/bin/node ${_app}/resources/helpers/node
  install -Dm755 "${srcdir}/rg.sh" ${_app}/node_modules/@vscode/ripgrep/bin/rg
  ln -sf /usr/bin/xdg-open ${_app}/node_modules/open/xdg-open
  if [[ -f usr/share/cursor/chrome-sandbox ]]; then
    chmod 4755 usr/share/cursor/chrome-sandbox
  fi
  # Install a launcher wrapper (instead of exposing the raw Electron binary).
  # This honors cursor-flags.conf and delegates to Cursor's upstream trampoline at /usr/share/cursor/bin/cursor.
  # and delegates to Cursor's upstream trampoline at /usr/share/cursor/bin/cursor.
  install -Dm755 /dev/stdin usr/bin/cursor <<'EOF'
#!/bin/bash
set -euo pipefail

cursor_bin="/usr/share/cursor/bin/cursor"
fallback_bin="/usr/share/cursor/cursor"
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/cursor-flags.conf"

if [[ ! -x "$cursor_bin" ]]; then
  cursor_bin="$fallback_bin"
fi

cursor_flags=()
if [[ -f "$flags_file" ]]; then
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%$'\r'}"
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    [[ -z "$line" || "$line" == \#* ]] && continue
    cursor_flags+=("$line")
  done < "$flags_file"
fi

case "${1:-}" in
  agent)
    exec "$cursor_bin" "$@"
    ;;
  editor)
    shift
    ;;
esac

exec "$cursor_bin" "${cursor_flags[@]}" "$@"
EOF
}
