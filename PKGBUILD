# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=onionspray
pkgver=1.7.0
pkgrel=1
pkgdesc="A tool to setup Onion Services for existing websites. Requires sudo to run."
arch=('any')
url="https://gitlab.torproject.org/tpo/onion-services/onionspray"
license=('GPL3')
depends=('perl' 'bash' 'tor')
makedepends=('git')
optdepends=('onionbalance: for load balancing onion services')
source=("git+https://gitlab.torproject.org/tpo/onion-services/onionspray.git#tag=v$pkgver")
sha256sums=('SKIP')

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

  # Ensure all scripts have execute permissions
  find "$pkgdir/opt/onionspray" -name "*.sh" -exec chmod 755 {} \;
  find "$pkgdir/opt/onionspray" -name "*.pl" -exec chmod 755 {} \;
  find "$pkgdir/opt/onionspray/vendors" -type f -exec chmod 755 {} \;

  # Create necessary directories with proper permissions
  install -dm700 "$pkgdir/opt/onionspray/secrets"
  install -dm700 "$pkgdir/opt/onionspray/projects"
  install -dm755 "$pkgdir/opt/onionspray/onionbalance"

  # Create wrapper script in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/onionspray" <<'EOF'
#!/bin/sh
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
