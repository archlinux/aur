# Maintainer: RealGecko <alexandrbezenkov@gmail.com>

pkgname=opencode-personal-knowledge-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="Personal knowledge MCP server with vector database for the Opencode ecosystem (prebuilt npm distribution)"
arch=('x86_64')
url="https://github.com/NocturnLabs/opencode-personal-knowledge"
license=('MIT')
depends=('bun')
provides=('opencode-personal-knowledge')
conflicts=('opencode-personal-knowledge')
options=('!strip')
source=("opencode-personal-knowledge-${pkgver}.tgz::https://registry.npmjs.org/opencode-personal-knowledge/-/opencode-personal-knowledge-${pkgver}.tgz"
        "bun.lock")
sha256sums=('4e36144c6093f1c1f94befa73567601a8f6b81fe6045681260069a93686b0c15'
            '17911d948af6523dcd238da1fe3cdd23e604678f17749538fab72254a7d08297')

prepare() {
    rm -rf opencode-personal-knowledge
    mv package opencode-personal-knowledge
    cp bun.lock opencode-personal-knowledge/bun.lock
}

build() {
    cd opencode-personal-knowledge
    bun install --frozen-lockfile --production --no-progress
}

package() {
    cd opencode-personal-knowledge
    local dest="$pkgdir/usr/lib/opencode-personal-knowledge"
    mkdir -p "$dest"
    cp -r dist node_modules package.json README.md "$dest/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/opencode-personal-knowledge" <<'EOF'
#!/bin/sh
exec /usr/bin/bun /usr/lib/opencode-personal-knowledge/dist/mcp-server.js "$@"
EOF
}
