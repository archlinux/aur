# Maintainer: Kenzo <codewithkenzo@gmail.com>

pkgname=exaflow-git
pkgver=2.1.1.r0.gd9fdcdc
pkgrel=1
pkgdesc="Advanced semantic search & AI integration toolkit with Exa API and MCP server support"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/codewithkenzo/exaflow"
license=('MIT')
depends=('nodejs>=18.0.0')
makedepends=('npm' 'git' 'typescript')
optdepends=('bun: Faster JavaScript runtime (recommended)')
provides=('exaflow' 'exaflow-mcp')
conflicts=('exaflow-bin')
source=("git+https://github.com/codewithkenzo/exaflow.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"

  # Setup npm configuration
  npm config set cache "$srcdir/.npm"

  # Install dependencies
  npm install --production=false

  # Build the project
  npm run build
}

package() {
  cd "$pkgname"

  # Install package in production mode
  npm install --production=true --prefix="$pkgdir"

  # Install symlinks to the binaries
  ln -sf "/usr/lib/node_modules/$pkgname/dist/cli.js" "$pkgdir/usr/bin/exaflow"
  ln -sf "/usr/lib/node_modules/$pkgname/dist/mcp-server.js" "$pkgdir/usr/bin/exaflow-mcp"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  # Install package.json for reference
  install -Dm644 package.json "$pkgdir/usr/share/doc/$pkgname/package.json"

  # Remove npm installation artifacts that aren't needed
  rm -rf "$pkgdir"/{node_modules/.cache,node_modules/.bin}
}

check() {
  cd "$pkgname"

  # Skip tests as they've been removed from git
  echo "Tests skipped - removed from git repository"
}

post_install() {
  echo
  echo "ExaFlow v$pkgver has been installed successfully!"
  echo
  echo "Quick start:"
  echo "  export EXA_API_KEY=your_api_key_here"
  echo "  exaflow --version"
  echo "  exaflow context 'test query' --tokens 100"
  echo
  echo "For MCP server:"
  echo "  exaflow-mcp"
  echo
  echo "Documentation:"
  echo "  https://github.com/codewithkenzo/exaflow"
  echo
}

post_upgrade() {
  post_install
}

post_remove() {
  echo
  echo "ExaFlow has been removed."
  echo "Your configuration files in ~/.config/exaflow/ remain."
  echo
}