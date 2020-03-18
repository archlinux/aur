# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-project
pkgver=0.12.0
pkgrel=1
pkgdesc='Bible study software focussing on topical study based on keywords/tags'
arch=('x86_64')
url="https://github.com/tobias-klein/$pkgname"
license=('GPL3')
depends=('electron'
         'icu'
         'nodejs')
makedepends=('jq'
             'moreutils'
             'node-gyp'
             'node-prune'
             'nodejs-addon-api' # run time dep but gets baked into electron asar
             'nodejs-pug-cli'
             'nodejs-sword-interface' # run time dep but gets baked into electron asar
             'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'ezra-project.sh')
sha256sums=('cf662fc55d658d5e03ed95025428b81b1d12cb6d3f0aed9b6e41278f80b65ecd'
            '0a36167bce248b6082045163cf60b143d02ca1e447a791cf0c88e960a7fdc618')
_electron="$(electron --version | sed 's/^v//')"

prepare() {
    cd "$pkgname-$pkgver"
    jq 'del(.dependencies["node-addon-api", "node-sword-interface"], .devDependencies["electron", "electron-osx-sign", "node-abi", "node-gyp", "pug-cli", "sequelize-cli"])' package.json |
        sponge package.json
}

build() {
    cd "$pkgname-$pkgver"
    rm -f node_modules/{node-addon-api,node-sword-interface}
    local _electron="$(electron --version | sed 's/^v//')"
    npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
    npx electron-rebuild --version="$_electron"
    node-prune node_modules
    npx electron-packager ./ "$pkgname" --electron-version="$_electron"
    ./build_scripts/purge_build_artifacts.sh
    npm link node-addon-api node-sword-interface
    npx electron-packager ./ "$pkgname" \
        --electron-version="$_electron" \
        --overwrite \
        --asar \
        --platform=linux \
        --arch=x64
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/resources/" "$pkgname-linux-x64/resources/app.asar"
    install -Dm644 -t "$pkgdir/usr/share/licences/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {CHANGELOG,README,TECH,LOC_METRICS}.md
}
