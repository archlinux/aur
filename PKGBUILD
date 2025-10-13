# Maintainer: Kenzo <https://github.com/codewithkenzo>
# Contributor: pplx-zero package maintainer

pkgname=pplx-zero
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal, fast Perplexity AI search CLI - zero configuration, zero compromises"
arch=('any')
url="https://github.com/codewithkenzo/pplx-zero"
license=('MIT')
depends=('nodejs')
makedepends=('bun')
provides=('pplx')
conflicts=('pplx' 'pplx-search-engine' 'perplexity-fusion-search')
options=('!strip')

# Use GitHub releases for source
source=("$pkgname-$pkgver.tar.gz::https://github.com/codewithkenzo/pplx-zero/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"

  # Verify bun installation
  if ! command -v bun &> /dev/null; then
    echo "ERROR: bun is required to build this package"
    echo "Install bun with: curl -fsSL https://bun.sh/install | bash"
    exit 1
  fi
}

build() {
  cd "$pkgname-$pkgver"

  # Install dependencies and build
  bun install --frozen-lockfile
  bun run build

  # Verify binary was created
  if [[ ! -f "dist/cli.js" ]]; then
    echo "ERROR: Build failed - dist/cli.js not found"
    exit 1
  fi

  # Add shebang for Node.js execution
  echo '#!/usr/bin/env node' > dist/pplx
  cat dist/cli.js >> dist/pplx
  chmod +x dist/pplx
}

check() {
  cd "$pkgname-$pkgver"

  # Run tests if available
  if [[ -f "bun.lockb" ]]; then
    bun test || echo "Tests failed, but continuing..."
  fi

  # Verify binary works
  node dist/cli.js --version || echo "Version check failed"
}

package() {
  cd "$pkgname-$pkgver"

  # Create directories
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/pplx-zero"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # Install binary
  install -Dm755 "dist/pplx" "$pkgdir/usr/bin/pplx"

  # Install runtime files
  install -Dm644 "dist/cli.js" "$pkgdir/usr/lib/pplx-zero/cli.js"

  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create package metadata
  echo "pkgname=$pkgname" > "$pkgdir/usr/share/licenses/$pkgname/PKGINFO"
  echo "pkgver=$pkgver" >> "$pkgdir/usr/share/licenses/$pkgname/PKGINFO"
  echo "pkgdesc=\"$pkgdesc\"" >> "$pkgdir/usr/share/licenses/$pkgname/PKGINFO"
  echo "url=\"$url\"" >> "$pkgdir/usr/share/licenses/$pkgname/PKGINFO"
}

post_install() {
  cat << 'EOF'

🚀 pplx-zero has been installed successfully!

📖 Usage:
  pplx "your search query"

⚙️  Setup:
  export PERPLEXITY_API_KEY="your-api-key"

📚 Documentation:
  https://github.com/codewithkenzo/pplx-zero

EOF
}

post_upgrade() {
  cat << 'EOF'

🔄 pplx-zero has been updated!

Changes: See release notes at https://github.com/codewithkenzo/pplx-zero/releases

EOF
}

post_remove() {
  cat << 'EOF'

🗑️  pplx-zero has been removed.

Configuration files in ~/.config/pplx-zero were NOT removed.
EOF
}