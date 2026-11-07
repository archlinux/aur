# Maintainer: Ultimate Bug Scanner AUR package
pkgname=ultimate-bug-scanner
pkgver=5.5.26
pkgrel=2
pkgdesc="Ultimate Bug Scanner meta-runner for multi-language bug scanning"
arch=('any')
url="https://github.com/Dicklesworthstone/ultimate_bug_scanner"
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'git' 'jq' 'ripgrep' 'python>=3.9' 'findutils' 'sed' 'gawk' 'grep' 'unzip' 'rsync' 'tar')
optdepends=('ast-grep: AST-powered JavaScript/TypeScript rules (auto-downloaded if absent)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dicklesworthstone/ultimate_bug_scanner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94ea7a42f8635dcf195942676e76b2a0c75fa3f3aad3b3a3a30da5ae82f9442e')

prepare() {
  cd "$srcdir/ultimate_bug_scanner-$pkgver"
  # Ensure the packaged runner pins the packaged service companion.
  local runner_sha daemon_sha
  runner_sha="$(grep -m1 '^UBS_DAEMON_SHA256=' ubs | sed -E 's/^UBS_DAEMON_SHA256="([^"]+)".*/\1/')"
  daemon_sha="$(sha256sum ubs-daemon | cut -d' ' -f1)"
  if [[ "$runner_sha" != "$daemon_sha" ]]; then
    echo "Runner does not pin the packaged service" >&2
    return 1
  fi
}

package() {
  cd "$srcdir/ultimate_bug_scanner-$pkgver"

  install -d "$pkgdir/usr/lib/ubs" "$pkgdir/usr/bin"
  install -Dm755 ubs "$pkgdir/usr/lib/ubs/ubs"
  install -Dm644 ubs-daemon "$pkgdir/usr/lib/ubs/ubs-daemon"
  cp -a modules "$pkgdir/usr/lib/ubs/modules"
  if [[ -f ubs-lsp ]]; then
    install -Dm755 ubs-lsp "$pkgdir/usr/lib/ubs/ubs-lsp"
    ln -s /usr/lib/ubs/ubs-lsp "$pkgdir/usr/bin/ubs-lsp"
  fi

  local daemon_sha
  daemon_sha="$(sha256sum "$pkgdir/usr/lib/ubs/ubs-daemon" | cut -d' ' -f1)"

  cat > "$pkgdir/usr/bin/ubs" <<EOF
#!/usr/bin/env bash
UBS_DAEMON_SHA256="$daemon_sha"
export UBS_DAEMON_SHA256
export UBS_PYTHON="/usr/bin/python3"
export UBS_NO_AUTO_UPDATE=1
export PATH="/usr/bin:\$PATH"
exec /usr/bin/bash /usr/lib/ubs/ubs "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/ubs"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
