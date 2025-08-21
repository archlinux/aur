# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=ccline-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A high-performance Claude Code statusline tool written in Rust with Git integration and real-time usage tracking."
arch=('x86_64')
url="https://github.com/Haleclipse/CCometixLine"
license=('GPL3')
source=("ccline-linux-x64.tar.gz::https://github.com/Haleclipse/CCometixLine/releases/download/v$pkgver/ccline-linux-x64.tar.gz")
sha256sums=('410161930f8919a59bdce8c02557ec3bd07d745baaa15e9bc12749392a146eb6')

package() {
  # Extract the tar.gz file
  tar -xzf "$srcdir/ccline-linux-x64.tar.gz" -C "$srcdir"

  # Check if ~/.claude/ directory exists
  if [ ! -d "$HOME/.claude" ]; then
    echo "Error: ~/.claude/ directory does not exist."
    echo "Please install claude-code first before installing this package."
    return 1
  fi

  # Create ~/.claude/ccline directory and install the binary
  install -d "$HOME/.claude/ccline"
  install -Dm755 "$srcdir/ccline" "$HOME/.claude/ccline/ccline"

  # Create system link to the binary
  install -d "$pkgdir/usr/bin"
  ln -sf "$HOME/.claude/ccline/ccline" "$pkgdir/usr/bin/ccline"
}

remove() {
  # Remove the binary from home directory
  rm -f "$HOME/.claude/ccline/ccline"

  # Remove the ccline directory if empty
  if [ -d "$HOME/.claude/ccline" ] && [ "$(ls -A "$HOME/.claude/ccline" 2>/dev/null)" = "" ]; then
    rmdir "$HOME/.claude/ccline"
  fi
}

