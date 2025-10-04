# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=nocodb
pkgver=0.265.1
pkgrel=1
pkgdesc="A no-code database platform that allows teams to collaborate and build processes with ease of a familiar and intuitive spreadsheet interface."
arch=('x86_64' 'aarch64')
url="https://nocodb.com"
license=('AGPL-3.0-or-later')
depends=('nodejs>=20.0.1'
    'libvips'
)
makedepends=('pnpm'
    'node-gyp'
    'python'
)
optdepends=('postgresql: recommended database'
    'litestream'
    'dasel: read litestream config'
    'mariadb-server'
    'redis'
)

backup=("usr/lib/systemd/system/nocodb.service")
source=(
    "git+https://github.com/nocodb/nocodb.git#tag=${pkgver}"
    "nocodb.service"
    "nocodb.install"
)
sha256sums=('SKIP'
            'd0846a6813e6ae1ddc784bf16fa3b4bc7efb3039d3822cadfcec14ca5c8a746b'
            '4bd9fdd4efa91ede112ac4cbeaf27fb7edbd464df823c9e64e5fa06b3c4a5c30')
options=('!debug' '!strip')

prepare() {
    export NODE_OPTIONS="--max_old_space_size=16384"
    export NODE_ENV=production
    cd ${srcdir}/nocodb
    pnpm --filter=nocodb-sdk install && pnpm --filter=nocodb-sdk run build
    pnpm --filter=nocodb --filter=nc-gui install
}

build() {
    export NODE_OPTIONS="--max_old_space_size=16384"
    export NUXT_TELEMETRY_DISABLED=1

    rm -rf ${srcdir}/app
    cp -r ${srcdir}/nocodb ${srcdir}/app && cd ${srcdir}/app
    pnpm run integrations:build && pnpm run registerIntegrations ##comment this if pkgver<=0.262
    #pnpm --filter=nc-gui run build:copy
    pnpm --filter=nocodb run docker:build
    ## only ship nocodb workspace prod deps with node_modules (1.9GB -> 400MB)
    rm -rf node_modules ./packages/nocodb/node_modules
    echo "node-linker=hoist" >>.npmrc
    pnpm install \
        --prefer-offline \
        --prod \
        --ignore-scripts \
        --filter=nocodb \
        --frozen-lockfile
    # nodejs 22.11.0 -> 22.12.0 broke pnpm rebuild somehow, so let's do it manaully
    for package in $(find -L packages/nocodb/node_modules -name binding.gyp -type f); do
        cd "$(dirname "$package")"
        node-gyp rebuild
        cd -
    done
}

package() {
    install -Dm644 nocodb.service ${pkgdir}/usr/lib/systemd/system/nocodb.service
    install -dm755 ${pkgdir}/var/lib/nocodb

    cd ${srcdir}/app/packages/nocodb
    install -Dm755 docker/start-litestream.sh ${pkgdir}/usr/bin/nocodb
    install -Dm644 docker/litestream.yml ${pkgdir}/etc/litestream.yml
    install -Dm644 docker/main.js ${pkgdir}/usr/share/nocodb/packages/nocodb/docker/main.js
    install -Dm644 package.json ${pkgdir}/usr/share/nocodb/packages/nocodb/package.json
    cp -r src/public ${pkgdir}/usr/share/nocodb/packages/nocodb/docker/
    cp -r node_modules ${pkgdir}/usr/share/nocodb/packages/nocodb/node_modules
    cp -r ${srcdir}/app/node_modules ${pkgdir}/usr/share/nocodb/node_modules
    cp -r ${srcdir}/app/packages/nocodb-sdk ${pkgdir}/usr/share/nocodb/packages/
}

install=nocodb.install
