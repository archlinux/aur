# Maintainer: Ayash Bera ayashbera@gmail.com
pkgname=keyshade
pkgver=3.0.2
pkgrel=4
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
    # This is the root cause of the MODULE_NOT_FOUND error
    find "$pkgdir/usr/lib/node_modules/@keyshade/cli" -name "sentry_cpu_profiler*.node" -delete
    
    # Remove unnecessary development files to reduce package size
    rm -rf "$pkgdir/usr/lib/node_modules/@keyshade/cli/src" 2>/dev/null || true
    rm -rf "$pkgdir/usr/lib/node_modules/@keyshade/cli/.turbo" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/.eslintrc.cjs" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/.swcrc" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/esbuild.config.js" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/tsconfig.json" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/node_modules/@keyshade/cli/tsup.config.ts" 2>/dev/null || true
    
    # Create a CommonJS wrapper script that disables Sentry profiling
    # Using .cjs extension to ensure it's treated as CommonJS despite package.json "type": "module"
    cat > "$pkgdir/usr/lib/node_modules/@keyshade/cli/wrapper.cjs" << 'EOF'
#!/usr/bin/env node

// Disable Sentry profiling completely to prevent glibc version conflicts
process.env.SENTRY_DISABLE = 'true';
process.env.SENTRY_PROFILING_ENABLED = 'false';
process.env.SENTRY_DISABLE_PROFILING = 'true';
process.env.NODE_ENV = process.env.NODE_ENV || 'production';

// Load the main CLI using CommonJS require
try {
    require('./dist/index.cjs');
} catch (error) {
    console.error('Error loading keyshade CLI:', error.message);
    process.exit(1);
}
EOF
    
    # Make the wrapper executable
    chmod +x "$pkgdir/usr/lib/node_modules/@keyshade/cli/wrapper.cjs"
    
    # Create the binary symlink pointing to our wrapper
    ln -s "../lib/node_modules/@keyshade/cli/wrapper.cjs" "$pkgdir/usr/bin/keyshade"
}

# To get the correct checksum, run:
# curl -s https://registry.npmjs.org/@keyshade/cli/-/cli-3.0.2.tgz | sha256sum
