# Maintainer: atvknox <atvknox at gmail dot com
# Ex-maintainer: Christopher Cooper <christopher@cg505.com>

pkgname=happy-cli
pkgver=1.1.8
pkgrel=1
pkgdesc="Mobile and Web client for Claude Code and Codex - remote control your AI coding agent"
arch=('any')
url="https://github.com/slopus/happy"
license=('MIT')
depends=('nodejs' 'ripgrep' 'difftastic')
makedepends=('pnpm' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slopus/happy/archive/refs/tags/cli-1.1.8.tar.gz")
b2sums=('15a4b414fd6fd2caaafd796caab1b0c866a3dfc2ab301565dd20ae64533fefb20b0b50e7500844a5af2e88b77fe79eaabfddb4ed88a7d5f0f45818637f96b1f4')

prepare() {
    cd "happy-cli-1.1.8"

    # Patch difftastic module to use system binary instead of internal download
    sed -i "s|resolve(join(projectPath(), 'tools', 'unpacked', binaryName))|'/usr/bin/difft'|" \
        packages/happy-cli/src/modules/difftastic/index.ts
}

build() {
    cd "happy-cli-1.1.8"
    
    # Configure local pnpm cache directory inside srcdir
    export PNPM_HOME="$srcdir/.pnpm-home"
    
    pnpm install --frozen-lockfile --aggregate-output
    
    # Run the build script straight out of the specific package folder directory
    cd packages/happy-cli
    pnpm build
}

package() {
    cd "happy-cli-1.1.8/packages/happy-cli"

    install -dm755 "$pkgdir/usr/"{lib/$pkgname,bin}

    # Copy distribution files and node modules required at runtime
    cp -r dist bin scripts package.json node_modules "$pkgdir/usr/lib/$pkgname/"

    # Clean up build-only utilities if they exist
    rm -f "$pkgdir/usr/lib/$pkgname/scripts/unpack-tools.cjs"

    # Create dummy folder for runtime path verification
    install -dm755 "$pkgdir/usr/lib/$pkgname/tools/unpacked"

    ln -s /usr/lib/$pkgname/bin/happy.mjs "$pkgdir/usr/bin/happy"
    ln -s /usr/lib/$pkgname/bin/happy-mcp.mjs "$pkgdir/usr/bin/happy-mcp"

    install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

