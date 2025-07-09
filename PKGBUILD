# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=nocodb
pkgver=0.263.8
pkgrel=2
pkgdesc="A no-code database platform that allows teams to collaborate and build processes with ease of a familiar and intuitive spreadsheet interface."
arch=('x86_64' 'aarch64')
url="https://nocodb.com"
license=('AGPL-3.0-or-later')
depends=('nodejs>=20.0.1')
makedepends=('pnpm'
    'node-gyp'
    'python'
    'libvips'
)
optdepends=('postgresql: recommended database'
    'litestream'
    'dasel: read litestream config'
    'mariadb-server'
    'valkey'
)

backup=("usr/lib/systemd/user/nocodb.service")
source=(
    "git+https://github.com/nocodb/nocodb.git#branch=master"
    "nocodb.service"
)
sha256sums=('SKIP'
    'SKIP'
)
options=('!debug' '!strip')

prepare() {
    export NODE_OPTIONS="--max_old_space_size=16384"
    export NUXT_TELEMETRY_DISABLED=1
    cd ${srcdir}/nocodb
    pnpm bootstrap
    pnpm --filter=nc-gui run build:copy
    pnpm --filter=nocodb run docker:build
}

build() {
    export NODE_OPTIONS="--max_old_space_size=16384"
    export NUXT_TELEMETRY_DISABLED=1

    rm -rf ${srcdir}/app
    cp -r ${srcdir}/nocodb ${srcdir}/app && cd ${srcdir}/app
    ##  only ship nocodb workspace prod deps with node_modules (1.9GB -> 400MB)
    rm -rf node_modules ./packages/nocodb/node_modules
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
    install -Dm644 nocodb.service ${pkgdir}/usr/lib/systemd/user/nocodb.service
    install -dm755 ${pkgdir}/var/lib/nocodb

    cd ${srcdir}/app/packages/nocodb
    install -Dm755 docker/start-litestream.sh ${pkgdir}/usr/bin/nocodb
    install -Dm644 docker/litestream.yml ${pkgdir}/etc/litestream.yml
    install -Dm644 docker/main.js ${pkgdir}/usr/share/nocodb/packages/nocodb/docker/main.js
    install -Dm644 package.json ${pkgdir}/usr/share/nocodb/packages/nocodb/package.json
    cp -r node_modules ${pkgdir}/usr/share/nocodb/packages/nocodb/node_modules
    cp -r ${srcdir}/app/node_modules ${pkgdir}/usr/share/nocodb/node_modules

    echo -e "Please change envs in \n/usr/lib/systemd/user/nocodb.service"
}
