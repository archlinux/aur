# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
# https://github.com/nihalxkumar/PKGBUILDs/tree/main/onionspray
pkgname=onionspray
pkgver=1.8.1
pkgrel=1
pkgdesc="A tool to setup Onion Services for existing websites.
arch=('any')
url="https://gitlab.torproject.org/tpo/onion-services/onionspray"
license=('GPL-3.0-or-later')
depends=('perl' 'bash' 'tor')
makedepends=('git')
optdepends=(
  'onionbalance: for load balancing onion services'
  'python: for validate-onion-key helper script'
  'ruby: for onion-csr helper script'
)
source=("git+https://gitlab.torproject.org/tpo/onion-services/onionspray.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  # Prevent failure when non-root users run onionspray commands (e.g. onionspray --help)
  sed -i 's/chmod 700 \$secrets_dir || exit 1/chmod 700 \$secrets_dir 2>\/dev\/null || true/' onionspray
}

build() {
  cd "$srcdir/$pkgname"
  # Initialize git submodules
  git submodule update --init --recursive
}

package() {
  cd "$srcdir/$pkgname"

  # Install to /opt/onionspray since it expects to be in a directory structure
  install -dm755 "$pkgdir/opt/onionspray"

  # Copy entire directory structure
  cp -r --preserve=mode . "$pkgdir/opt/onionspray/" 2>/dev/null || true

  # Preserve .git directory for git operations
  # (needed by onionspray scripts)

  # Ensure executable scripts have proper execute permissions
  chmod 755 "$pkgdir/opt/onionspray/onionspray" 2>/dev/null || true
  find "$pkgdir/opt/onionspray" -name "*.sh" -exec chmod 755 {} \;
  find "$pkgdir/opt/onionspray" -name "*.pl" -exec chmod 755 {} \;
  find "$pkgdir/opt/onionspray/lib" -type f \( -name "*.sh" -o -name "*.pl" -o -name "*.py" \) -exec chmod 755 {} 2>/dev/null \; || true
  chmod 755 "$pkgdir/opt/onionspray/vendors/onionmine/onionmine" 2>/dev/null || true
  chmod 755 "$pkgdir/opt/onionspray/vendors/onionmine/bin/"* 2>/dev/null || true

  # Create necessary directories with proper permissions
  install -dm700 "$pkgdir/opt/onionspray/secrets"
  install -dm700 "$pkgdir/opt/onionspray/projects"
  install -dm755 "$pkgdir/opt/onionspray/onionbalance"

  # Create wrapper script in /usr/bin (intercept self-update commands)
  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/onionspray" <<'EOF'
#!/bin/sh
if [ "$1" = "update" ] || [ "$1" = "upgrade" ]; then
  echo "error: 'onionspray $1' is disabled for package-managed installations." >&2
  echo "Please update via: sudo pacman -Syu onionspray" >&2
  exit 1
fi
exec /opt/onionspray/onionspray "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/onionspray"

  # Install documentation
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true
  install -Dm644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
