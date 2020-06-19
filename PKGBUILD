# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-project
pkgver=0.13.0
pkgrel=1
pkgdesc='Bible study tool focussing on topical study based on keywords/tags'
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
             'nodejs-sword-interface>=0.138.0' # run time dep but gets baked into electron asar
             'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'ezra-project.sh')
sha256sums=('b46c13cd5e059dec7a3b25bc7bac694188a70b25cfd8e31f76a94c557b2478e9'
            '0a36167bce248b6082045163cf60b143d02ca1e447a791cf0c88e960a7fdc618')

prepare() {
    cd "$pkgname-$pkgver"
    jq 'del(.dependencies["node-addon-api", "node-sword-interface"], .devDependencies["electron", "electron-osx-sign", "node-abi", "node-gyp", "pug-cli", "sequelize-cli"])' package.json |
        sponge package.json
    rm -f node_modules/{node-addon-api,node-sword-interface}
    npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
}

build() {
    cd "$pkgname-$pkgver"
    local _electron="$(electron --version | sed 's/^v//')"
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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {CHANGELOG,README,TECH,LOC_METRICS}.md
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" icons/$pkgname.svg
}
