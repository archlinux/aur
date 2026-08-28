# Maintainer: lifespirit <life@crabs.pro>
pkgname=homeassistant-matterjs-server
pkgver=1.3.3
pkgrel=2
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
    'c9aa58264551d618e9c2ea9f5c04fa39a1d10f4bf9634b59cabaef3c8f2423d5'
    '3bc1e5da1c5b9e4212142a36d41f48812a7a6c5008c2332e47894edd2e4cd974'
    '029f0bcae618ee29c0a6620975ff5019885cfa24fc13fdf2097d4153be57f792'
)

build() {
    cd "$srcdir/$pkgname"

    export npm_config_cache="$srcdir/npm-cache"
    export npm_config_nodedir=/usr

    # Ставим полный набор build-зависимостей и собираем исходники.
    npm ci \
        --include=dev \
        --include=optional \
        --foreground-scripts \
        --no-audit \
        --no-fund

    test -f packages/matter-server/dist/esm/MatterServer.js

    # Создаем npm-пакеты ИМЕННО из собранных нами исходников.
    rm -rf "$srcdir/runtime-pkgs"
    mkdir -p "$srcdir/runtime-pkgs"

    npm pack \
        --workspaces \
        --pack-destination "$srcdir/runtime-pkgs"

    # Формируем отдельное чистое production-дерево.
    rm -rf "$srcdir/runtime"
    mkdir -p "$srcdir/runtime"

    cd "$srcdir/runtime"

    npm init -y >/dev/null

    npm install \
        --omit=dev \
        --include=optional \
        --foreground-scripts \
        --no-audit \
        --no-fund \
        "$srcdir"/runtime-pkgs/*.tgz

    # Проверяем критичные runtime зависимости.
    test -f node_modules/matter-server/dist/esm/MatterServer.js
    test -d node_modules/commander
    test -d node_modules/express
    test -d node_modules/@matter-server/ws-controller

    # Дополнительно проверяем загрузку CLI.
    node \
        --enable-source-maps \
        node_modules/matter-server/dist/esm/MatterServer.js \
        --help >/dev/null
}

package() {
    install -dm755 \
        "$pkgdir/usr/share/matterjs-server"

    cp -a \
        "$srcdir/runtime/node_modules" \
        "$pkgdir/usr/share/matterjs-server/"

    install -Dm644 \
        "$srcdir/$pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 \
        "$srcdir/$pkgname/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 \
        "$srcdir/$pkgname/docs/cli.md" \
        "$pkgdir/usr/share/doc/$pkgname/cli.md"

    install -Dm644 \
        "$srcdir/matterjs-server.service" \
        "$pkgdir/usr/lib/systemd/system/matterjs-server.service"

    install -Dm644 \
        "$srcdir/matterjs-server.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/matterjs-server.conf"

    install -Dm644 \
        "$srcdir/matterjs-server.conf" \
        "$pkgdir/etc/conf.d/matterjs-server"
}
