pkgname=mtc
pkgver=0.4.0
pkgrel=4
pkgdesc="C++ compiler for mt-lang"
arch=('x86_64')
url="https://github.com/mystyy01/mt-lang-compiler"
license=('custom:unknown')
depends=('glibc' 'clang')
makedepends=('gcc' 'make' 'git')
source=("$pkgname::git+$url#branch=main")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make -j8 release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "dist/mtc" "$pkgdir/usr/bin/mtc"
  install -Dm755 "dist/mtc_lsp" "$pkgdir/usr/lib/mtc/mtc_lsp_server"

  install -d "$pkgdir/usr/lib/mtc_stdlib"
  cp -a stdlib/. "$pkgdir/usr/lib/mtc_stdlib/"

  install -d "$pkgdir/usr/share/mtc/vscode-extension"
  cp -a syntax_extension/. "$pkgdir/usr/share/mtc/vscode-extension/"

  cat > "$pkgdir/usr/bin/mtc-lsp" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

server="/usr/lib/mtc/mtc_lsp_server"
vscode_extension_src="/usr/share/mtc/vscode-extension"

usage() {
  cat <<'TXT'
Usage:
  mtc-lsp [server args...]
  mtc-lsp serve [server args...]
  mtc-lsp install vscode

Commands:
  serve            Run the mtc language server
  install vscode   Install/update bundled VS Code extension in your user profile
TXT
}

install_vscode_extension() {
  if [[ ! -d "$vscode_extension_src" ]]; then
    echo "Error: bundled VS Code extension not found at $vscode_extension_src" >&2
    exit 1
  fi

  local extensions_dir
  if [[ -n "${VSCODE_EXTENSIONS_DIR:-}" ]]; then
    extensions_dir="$VSCODE_EXTENSIONS_DIR"
  elif [[ -d "$HOME/.vscode/extensions" || ! -d "$HOME/.vscode-oss/extensions" ]]; then
    extensions_dir="$HOME/.vscode/extensions"
  else
    extensions_dir="$HOME/.vscode-oss/extensions"
  fi

  local target_dir="$extensions_dir/mtlang.mtc"
  mkdir -p "$extensions_dir"
  rm -rf "$target_dir"
  cp -a "$vscode_extension_src" "$target_dir"
  echo "Installed VS Code extension to: $target_dir"
  echo "Restart VS Code/VSCodium to load updates."
}

if [[ $# -eq 0 ]]; then
  exec "$server"
fi

case "$1" in
  -h|--help|help)
    usage
    ;;
  serve)
    shift
    exec "$server" "$@"
    ;;
  install)
    if [[ "${2:-}" != "vscode" ]]; then
      echo "Error: only 'install vscode' is currently supported." >&2
      usage >&2
      exit 1
    fi
    install_vscode_extension
    ;;
  *)
    exec "$server" "$@"
    ;;
esac
EOF
  chmod 755 "$pkgdir/usr/bin/mtc-lsp"

  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
