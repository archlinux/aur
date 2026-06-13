# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=smithery-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Registry installer and manager for Model Context Protocol (MCP) servers"
arch=('any')
url="https://smithery.ai/"
license=('AGPL-3.0-or-later')
depends=('nodejs>=20')
makedepends=('pnpm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smithery-ai/cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3fd343d142da238a061f52c2e012b07b8c87d32a2eb9d1dce7beac39d3d20adb')

build() {
  cd "$srcdir/cli-$pkgver"

  # Install dependencies using pnpm
  pnpm install --frozen-lockfile

  # Build the project
  pnpm run build
}

package() {
  cd "$srcdir/cli-$pkgver"

  # Install production dependencies only (skip postinstall script)
  pnpm install --frozen-lockfile --prod --ignore-scripts

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
