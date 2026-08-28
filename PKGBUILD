# Maintainer: lifespirit <life@crabs.pro>
pkgname=homeassistant-matterjs-server
pkgver=1.3.3
pkgrel=1
pkgdesc='Open Home Foundation Matter Server based on matter.js'
arch=('x86_64' 'aarch64')
url='https://github.com/matter-js/matterjs-server'
license=('Apache-2.0')

depends=(
    'nodejs>=22.13.0'
    'bluez'
    'iputils'
)

makedepends=(
    'git'
    'npm'
    'python'
)

backup=(
    'etc/conf.d/matterjs-server'
)

source=(
    "$pkgname::git+https://github.com/matter-js/matterjs-server.git#tag=v${pkgver}"
    'matterjs-server.service'
    'matterjs-server.sysusers'
    'matterjs-server.conf'
)

sha256sums=(
    'SKIP'
    '48155a7307c5487efa32f67b739602c7ea540dad4b3ab997808e9dbc974f23af'
    '3bc1e5da1c5b9e4212142a36d41f48812a7a6c5008c2332e47894edd2e4cd974'
    '029f0bcae618ee29c0a6620975ff5019885cfa24fc13fdf2097d4153be57f792'
)

build() {
    cd "$srcdir/$pkgname"

    # Keep npm cache outside of the source tree.
    export npm_config_cache="$srcdir/npm-cache"

    # Use the Node headers provided by the Arch nodejs package instead
    # of letting node-gyp download another copy.
    export npm_config_nodedir=/usr

    # package-lock.json is provided by upstream.
    #
    # The root package has:
    #   "prepare": "npm run build-clean"
    #
    # so npm ci also performs the complete Matter Server build.
    npm ci \
        --include=dev \
        --include=optional \
        --foreground-scripts \
        --no-audit \
        --no-fund

    # Make the build fail immediately if the server was not generated.
    test -f packages/matter-server/dist/esm/MatterServer.js
}

package() {
    cd "$srcdir/$pkgname"

    export npm_config_cache="$srcdir/npm-cache"
    export npm_config_nodedir=/usr

    # Remove TypeScript, test and other build-only npm dependencies.
    # Optional dependencies are intentionally retained because Matter Server
    # uses them for BLE support.
    npm prune \
        --omit=dev \
        --no-audit \
        --no-fund

    install -dm755 \
        "$pkgdir/usr/share/matterjs-server"

    # Runtime npm dependencies. Preserve workspace symlinks.
    cp -a \
        node_modules \
        "$pkgdir/usr/share/matterjs-server/"

    # Workspace packages referenced through node_modules symlinks.
    local workspace
    for workspace in \
        ble-proxy \
        custom-clusters \
        dashboard \
        matter-server \
        ws-client \
        ws-controller
    do
        install -dm755 \
            "$pkgdir/usr/share/matterjs-server/packages/$workspace"

        cp -a \
            "packages/$workspace/dist" \
            "$pkgdir/usr/share/matterjs-server/packages/$workspace/"

        install -Dm644 \
            "packages/$workspace/package.json" \
            "$pkgdir/usr/share/matterjs-server/packages/$workspace/package.json"
    done

    # License and documentation.
    install -Dm644 \
        LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 \
        README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 \
        docs/cli.md \
        "$pkgdir/usr/share/doc/$pkgname/cli.md"

    # systemd service.
    install -Dm644 \
        "$srcdir/matterjs-server.service" \
        "$pkgdir/usr/lib/systemd/system/matterjs-server.service"

    # systemd-sysusers configuration.
    install -Dm644 \
        "$srcdir/matterjs-server.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/matterjs-server.conf"

    # Runtime configuration.
    install -Dm644 \
        "$srcdir/matterjs-server.conf" \
        "$pkgdir/etc/conf.d/matterjs-server"
}
