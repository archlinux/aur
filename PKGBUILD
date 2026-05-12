# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com

pkgname=claudecodeui
_pkgname=claudecodeui
pkgver=1.31.5
pkgrel=2
pkgdesc="Web-based UI for Claude Code, Cursor CLI, Codex, and Gemini CLI (CloudCLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/siteboon/claudecodeui"
license=('AGPL-3.0-or-later')
install="$pkgname.install"
depends=(
  'nodejs-lts-jod'
  'npm'
)
makedepends=(
  'cmake'
  'python'
  'libvips'
)
optdepends=(
  'claude-code: Claude Code CLI'
  'gemini-cli: Google Gemini CLI'
)
provides=('cloudcli')
conflicts=('cloudcli-bin')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/siteboon/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ee11106fecd42153e9b14a518dbc4174181e6f62d19e6d95b91fb38505030a15')

build() {
  cd "$_pkgname-$pkgver"
  npm ci
  npm run build
  npm prune --production
}

_remove_foreign_platforms() {
  local appdir="$1"
  local remove_patterns=()

  case $CARCH in
    x86_64)
      remove_patterns=(
        '*-linux-x64-musl' '*-linux-arm64' '*-linux-arm' '*-darwin-*' '*-win32-*'
        'darwin-arm64' 'darwin-x64' 'win32-arm64' 'win32-x64' 'linux-arm64' 'linux-arm'
      )
      ;;
    aarch64)
      remove_patterns=(
        '*-linux-x64' '*-linux-x64-musl' '*-darwin-*' '*-win32-*'
        'darwin-arm64' 'darwin-x64' 'win32-arm64' 'win32-x64' 'linux-x64'
      )
      ;;
  esac

  for pattern in "${remove_patterns[@]}"; do
    find "$appdir/node_modules" -maxdepth 3 -type d -name "$pattern" -exec rm -rf {} + 2>/dev/null || true
  done

  if [ "$CARCH" = "x86_64" ]; then
    find "$appdir/node_modules" -path '*/prebuilds/linux-x64/*.musl.node' -delete 2>/dev/null || true
  fi
}

package() {
  cd "$_pkgname-$pkgver"

  local appdir="$pkgdir/usr/lib/node_modules/@cloudcli-ai/cloudcli"
  install -dm0755 "$appdir"

  cp -r dist dist-server server shared scripts node_modules package.json "$appdir"
  install -Dm0644 README.md "$appdir/README.md"

  _remove_foreign_platforms "$appdir"

  # Remove build-time source dirs with python/perl scripts (katex etc.)
  find "$appdir/node_modules" -type d \( -name 'src' -o -name 'fonts' -o -name 'metrics' \) -path '*/katex/*' -exec rm -rf {} + 2>/dev/null || true

  # Remove dev artifacts and docs from node_modules
  find "$appdir/node_modules" -type f \( -name '*.md' -o -name '*.txt' -name 'LICENSE*' -o -name 'CHANGELOG*' -o -name '.npmignore' -o -name '.eslintrc*' -o -name '*.map' \) -delete 2>/dev/null || true
  find "$appdir/node_modules" -type d -name '.git' -exec rm -rf {} + 2>/dev/null || true
  find "$appdir/node_modules" -type d -name '.husky' -exec rm -rf {} + 2>/dev/null || true
  find "$appdir/node_modules" -type d \( -name 'test' -o -name 'tests' -o -name '__tests__' -o -name 'spec' -o -name 'docs' -o -name 'example' -o -name 'examples' \) -exec rm -rf {} + 2>/dev/null || true

  # Remove empty directories left by npm prune
  find "$appdir/node_modules" -type d -empty -not -path '*/.git/*' -delete 2>/dev/null || true

  # Fix permissions for node-pty spawn-helper
  local spawn_helper="$appdir/node_modules/node-pty/build/Release/spawn-helper"
  if [ -f "$spawn_helper" ]; then
    chmod 0755 "$spawn_helper"
  fi

  # Make CLI entry point executable
  chmod 0755 "$appdir/dist-server/server/cli.js"

  install -dm0755 "$pkgdir/usr/bin"
  ln -s /usr/lib/node_modules/@cloudcli-ai/cloudcli/dist-server/server/cli.js "$pkgdir/usr/bin/cloudcli"
}
