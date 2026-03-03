# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=copilot-api
pkgver=0.7.0
pkgrel=1
pkgdesc='Turn GitHub Copilot into OpenAI/Anthropic API compatible server'
arch=('any')
url='https://github.com/ericc-ch/copilot-api'
license=('MIT')
depends=('bun')
optdepends=('xsel: clipboard support for manual usage')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ericc-ch/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('d068030271b917c9f59e21dda4dbd36840372160efa1b1f0598e35dc277689de'
            'a7004c6615c495e2de12b63bf6babd5e44a45c75302d0038bccae7698508e403'
            '0f92b16903a63303768377725ea7f73f253221ef0cb42e08cc8bacf0d8cd17d1'
            'aa2a9bd994a6b258b09d9d9efc9d9cb5429bd5378855ca2a53ad18c3ac7b0558')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install dependencies, build, then prune devDependencies
    bun install --frozen-lockfile
    bun run build
    # Nuke node_modules, then reinstall production deps only
    rm -rf node_modules
    bun install --frozen-lockfile --production --ignore-scripts
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Create installation directories
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    
    # Install built files
    cp -r dist/* "$pkgdir/usr/lib/$pkgname/"
    cp -r node_modules "$pkgdir/usr/lib/$pkgname/"
    cp package.json "$pkgdir/usr/lib/$pkgname/"
    
    # Fix shebang to use bun instead of node
    sed -i '1s|.*|#!/usr/bin/env bun|' "$pkgdir/usr/lib/$pkgname/main.js"

    # Remove standalone node CLI scripts that are not used at runtime
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/is-inside-container/cli.js"
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/is-docker/cli.js"
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/which/bin/node-which"
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/srvx/bin/srvx.mjs"
    # Remove broken symlinks and empty .bin dir left by cli removal
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/.bin/is-docker"
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/.bin/is-inside-container"
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/.bin/node-which"
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/.bin/srvx"
    rmdir "$pkgdir/usr/lib/$pkgname/node_modules/.bin" 2>/dev/null || true
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/$pkgname/node_modules/which/bin"
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/$pkgname/node_modules/srvx/bin"
    
    # Remove bundled xsel - clipboardy auto-detects system xsel from PATH
    rm -f "$pkgdir/usr/lib/$pkgname/node_modules/clipboardy/fallbacks/linux/xsel"
    # Remove Windows clipboard fallbacks - not needed on Linux
    rm -rf "$pkgdir/usr/lib/$pkgname/node_modules/clipboardy/fallbacks/windows"
    # Clean up any empty fallback dirs
    find "$pkgdir/usr/lib/$pkgname/node_modules/clipboardy/fallbacks" \
        -type d -empty -delete 2>/dev/null || true
    # Create wrapper script
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec bun run /usr/lib/copilot-api/main.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install systemd service
    install -Dm644 "$srcdir/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install sysusers.d config
    install -Dm644 "$srcdir/$pkgname.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    # Install tmpfiles.d config (creates /var/lib/copilot-api on package install)
    install -Dm644 "$srcdir/$pkgname.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

