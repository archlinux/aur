# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=happy-cli-git
pkgver=r1518.3ed8b121
pkgrel=1
pkgdesc="Mobile and Web client for Claude Code and Codex - remote control your AI coding agent"
arch=('any')
url="https://github.com/slopus/happy"
license=('MIT')
# Upstream bundles ripgrep and difftastic binaries, but we use system packages instead.
# Difftastic: patched in prepare() to use /usr/bin/difft
# Ripgrep: no patch needed - the launcher script (scripts/ripgrep_launcher.cjs) has a
#          fallback chain that searches system PATH before using bundled binaries
depends=('nodejs' 'ripgrep' 'difftastic')
makedepends=(
    'yarn'
    'npm'  # used to create isolated production install (see build())
    'git'
)
conflicts=('happy-cli')
provides=('happy-cli')
source=("$pkgname::git+https://github.com/slopus/happy.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname/packages/happy-cli"

    # Patch difftastic module to use system binary instead of bundled one.
    # The bundled binary path is hardcoded in getBinaryPath() - we replace it
    # with the system path. Ripgrep doesn't need this - its launcher already
    # searches system PATH as a fallback.
    sed -i "s|resolve(join(projectPath(), 'tools', 'unpacked', binaryName))|'/usr/bin/difft'|" \
        src/modules/difftastic/index.ts
}

build() {
    cd "$srcdir/$pkgname/packages/happy-cli"

    # Install all deps (devDeps needed for build and check)
    yarn install --frozen-lockfile --cache-folder "$srcdir/yarn-cache"
    yarn build

    # Create production node_modules in isolated directory outside the monorepo.
    # Why: upstream uses yarn workspaces which hoists deps to the monorepo root.
    # If we ran "yarn install --production" here, deps would be hoisted and not
    # available in packages/happy-cli/node_modules. By copying package.json to
    # an isolated directory and running npm there, we get a flat node_modules
    # with all production deps, matching what users get from "npm install".
    # --ignore-scripts: skip postinstall (unpack-tools.cjs) since we use system tools
    mkdir -p "$srcdir/prod-install"
    cp package.json "$srcdir/prod-install/"
    cd "$srcdir/prod-install"
    npm install --omit=dev --ignore-scripts --cache "$srcdir/npm-cache"
}

check() {
    cd "$srcdir/$pkgname/packages/happy-cli"
    # Run unit tests only (integration tests require running happy server)
    yarn vitest run --exclude='**/*.integration.test.ts'
}

package() {
    cd "$srcdir/$pkgname/packages/happy-cli"

    install -dm755 "$pkgdir/usr/"{lib/happy-cli,bin}

    # Copy built files and runtime scripts
    cp -r dist bin scripts package.json "$pkgdir/usr/lib/happy-cli/"

    # Copy production node_modules from isolated install
    cp -r "$srcdir/prod-install/node_modules" "$pkgdir/usr/lib/happy-cli/"

    # Remove unpack-tools script - it extracts bundled binaries which we don't use
    rm "$pkgdir/usr/lib/happy-cli/scripts/unpack-tools.cjs"

    ln -s /usr/lib/happy-cli/bin/happy.mjs "$pkgdir/usr/bin/happy"
    ln -s /usr/lib/happy-cli/bin/happy-mcp.mjs "$pkgdir/usr/bin/happy-mcp"

    install -Dm644 "$srcdir/$pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
