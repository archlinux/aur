# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=smithery-cli
pkgver=1.6.3
pkgrel=1
pkgdesc="Registry installer and manager for Model Context Protocol (MCP) servers"
arch=('any')
url="https://smithery.ai/"
license=('AGPL-3.0-or-later')
depends=('nodejs>=20')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smithery-ai/cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9282004a7a30ed65895c16869d998b27d7fd168eb22753a06b76421630196a45')

build() {
  cd "$srcdir/cli-$pkgver"

  # Use npm ci for reproducible builds (uses package-lock.json)
  npm ci --cache "$srcdir/npm-cache"

  # Build the project
  npm run build
}

package() {
  cd "$srcdir/cli-$pkgver"

  # Install production dependencies only (skip scripts to avoid rebuild)
  npm ci --omit=dev --ignore-scripts --cache "$srcdir/npm-cache"

  # Install to /usr/lib/node_modules/@smithery/cli
  install -dm755 "$pkgdir/usr/lib/node_modules/@smithery/cli"

  # Copy built files
  cp -r dist "$pkgdir/usr/lib/node_modules/@smithery/cli/"
  cp package.json "$pkgdir/usr/lib/node_modules/@smithery/cli/"
  cp README.md "$pkgdir/usr/lib/node_modules/@smithery/cli/"

  # Copy production dependencies
  cp -r node_modules "$pkgdir/usr/lib/node_modules/@smithery/cli/"

  # Create symlink for binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/@smithery/cli/dist/index.js" "$pkgdir/usr/bin/smithery"

  # Ensure binary is executable
  chmod +x "$pkgdir/usr/lib/node_modules/@smithery/cli/dist/index.js"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
