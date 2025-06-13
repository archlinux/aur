# Maintainer: Ayash Bera ayashbera@gmail.com
pkgname=keyshade
pkgver=3.0.2
pkgrel=6
pkgdesc="Realtime secret and configuration management CLI tool with end-to-end encryption"
arch=('any')
url="https://github.com/keyshade-xyz/keyshade"
license=('MPL2')
depends=('nodejs' 'npm')
optdepends=('git: for git integration features')
source=("https://registry.npmjs.org/@keyshade/cli/-/cli-$pkgver.tgz")
sha256sums=('5a27a8e37846acf91d46e80d4dc76ff4dbf15430d6482006e934d7d92752cafe')

package() {
    cd "$srcdir/package"
    
    # Create directory structure
    install -dm755 "$pkgdir/usr/lib/node_modules/@keyshade/cli"
    install -dm755 "$pkgdir/usr/bin"
    
    # Copy all package files to the node_modules location
    cp -r * "$pkgdir/usr/lib/node_modules/@keyshade/cli/"
    
    # Remove Sentry profiler native modules that cause glibc version conflicts
    find "$pkgdir/usr/lib/node_modules/@keyshade/cli" -name "sentry_cpu_profiler*.node" -delete
    
    # Remove unnecessary development files to reduce package size
    rm -rf "$pkgdir/usr/lib/node_modules/@keyshade/cli/src" 2>/dev/null || true
    rm -rf "$pkgdir/usr/lib/node_modules/@keyshade/cli/.turbo" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/.eslintrc.cjs" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/.swcrc" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/esbuild.config.js" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/tsconfig.json" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/tsup.config.ts" 2>/dev/null || true
    
    # Create a simple shell wrapper that disables Sentry profiling
    cat > "$pkgdir/usr/bin/keyshade" << 'EOF'
#!/bin/bash

# Disable Sentry profiling to prevent glibc version conflicts with native modules
export SENTRY_PROFILING_ENABLED=false
export SENTRY_DISABLE=true
export NODE_ENV=${NODE_ENV:-production}

# Execute the actual CLI
exec node /usr/lib/node_modules/@keyshade/cli/dist/index.cjs "$@"
EOF
    
    # Make the wrapper executable
    chmod +x "$pkgdir/usr/bin/keyshade"
    
    # Make the main script executable
    chmod +x "$pkgdir/usr/lib/node_modules/@keyshade/cli/dist/index.cjs"
}

# To get the correct checksum, run:
# curl -s https://registry.npmjs.org/@keyshade/cli/-/cli-3.0.2.tgz | sha256sum
