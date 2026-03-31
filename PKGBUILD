# Maintainer: hugo <wanxpgm@gmail.com>

pkgname=claude-code-bridge-git
pkgver=5.2.9.r1.g8e4d63b
pkgrel=1
pkgdesc='Claude Code Bridge (CCB): unified multi-provider terminal bridge for Claude/Codex/Gemini and more'
arch=('any')
url='https://github.com/bfly123/claude_code_bridge'
license=('AGPL-3.0-or-later')
depends=('python>=3.10')
makedepends=('git')
optdepends=(
  'python-watchdog: file system watch support (fallback to polling if absent)'
  'tmux: terminal backend (recommended on Linux/macOS/WSL)'
  'wezterm: alternative terminal backend'
)
provides=('claude-code-bridge')
conflicts=('claude-code-bridge')
source=('git+https://github.com/bfly123/claude_code_bridge.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/claude_code_bridge"

  local _version _rev _hash
  _version="$(grep -m1 '^VERSION = ' ccb | cut -d'"' -f2)"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short=7 HEAD)"

  printf '%s.r%s.g%s\n' "$_version" "$_rev" "$_hash"
}

package() {
  cd "$srcdir/claude_code_bridge"

  local _pkgroot="$pkgdir/usr/lib/claude-code-bridge"
  local _link_paths=(
    'bin/cask' 'bin/cpend' 'bin/cping'
    'bin/gask' 'bin/gpend' 'bin/gping'
    'bin/oask' 'bin/opend' 'bin/oping'
    'bin/lask' 'bin/lpend' 'bin/lping'
    'bin/dask' 'bin/dpend' 'bin/dping'
    'bin/hask' 'bin/hpend' 'bin/hping'
    'bin/bask' 'bin/bpend' 'bin/bping'
    'bin/qask' 'bin/qpend' 'bin/qping'
    'bin/ask' 'bin/ccb-ping' 'bin/pend' 'bin/autonew'
    'bin/ccb-completion-hook' 'bin/maild' 'bin/ctx-transfer'
    'ccb'
  )

  install -dm755 "$_pkgroot"
  cp -a ccb bin lib config claude_skills codex_skills droid_skills mcp install.sh \
    README.md README_zh.md CHANGELOG.md CHANGELOG_4.0.md "$_pkgroot/"

  # Keep package lightweight and avoid extra fastapi dependency from web UI.
  rm -rf "$_pkgroot/lib/web" "$_pkgroot/bin/ccb-web"

  install -dm755 "$pkgdir/usr/bin"
  local _path _name
  for _path in "${_link_paths[@]}"; do
    _name="$(basename "$_path")"
    ln -s "/usr/lib/claude-code-bridge/$_path" "$pkgdir/usr/bin/$_name"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
